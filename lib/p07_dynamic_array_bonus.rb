class StaticArray
  attr_reader :store

  def initialize(capacity)
    @store = Array.new(capacity)
  end

  def [](i)
    validate!(i)
    self.store[i]
  end

  def []=(i, val)
    validate!(i)
    self.store[i] = val
  end

  def length
    self.store.length
  end

  private

  def validate!(i)
    raise "Overflow error" unless i.between?(0, self.store.length - 1)
  end
end

class DynamicArray
  include Enumerable
  attr_accessor :count
  
  def initialize(capacity = 8)
    @store = StaticArray.new(capacity)
    @count = 0
  end

  # defines the number of places an element CAN be stored in the array
  # count is the number of places from 0 to the last index where an element is stored
  # example: [nil, nil, 0, nil] @count == 3, capacity == 4
  def capacity
    @store.length
  end
  
  def [](i)
    # handles negative indices
    i = count + i if i < 0
    return @store[i] if i >= 0 && i < capacity
    # return nil instead of undefined if going outside array bounds
    nil
  end
  
  def []=(i, val)
    # handle negative indices
    i = count + i if i < 0
    # increment count depending on index
    # and whether we're replacing a value or adding a new one
    new_count = count
    if i > count
      new_count = i + 1
    elsif count == i
      # we're adding a new element to the end
      new_count = count + 1
    end
    # if you reset count before running #resize
    # you'll get an out of bounds error
    # resize doubles the memory every time
    resize! until new_count <= capacity
    @count = new_count
    @store[i] = val
  end

  def include?(val)
    each { |el| return true if el == val }
    false
  end

  def push(val)
    self[count] = val
    val
  end

  def unshift(val)
    i = count
    until i == 0
      self[i] = self[i - 1]
      i -= 1
    end
    self[0] = val
    val
  end

  def pop
    return nil if count == 0
    el = last
    # if you swap the order of these two lines, count is incremented 
    # incorrectly in []=
    self[count - 1] = nil
    @count -= 1
    el
  end
  
  def shift
    return nil if count == 0
    el = first
    (1...count).each do |i| 
      self[i - 1] = self[i]
    end
    # if you swap the order of these two lines, count is incremented 
    # incorrectly in []=
    self[count - 1] = nil
    @count -= 1
    el
  end

  def first
    self[0]
  end

  def last
    self[-1]
  end

  def ==(other)
    return false unless [Array, DynamicArray].include?(other.class)
    return false unless @count == other.length
    each_with_index { |el, i| return false unless el == other[i] }
    true
  end

  def each
    i = 0
    while i < count
      el = @store[i]
      yield( el )
      i += 1
    end
    self
  end

  def to_s
    "[" + inject([]) { |acc, el| acc << el }.join(", ") + "]"
  end

  alias_method :<<, :push
  [:length, :size].each { |method| alias_method method, :count }

  private

  def resize!
    old_array = @store
    @store = StaticArray.new(capacity * 2)
    num_els = count
    @count = 0
    until count == num_els
      @store[count] = old_array[count]
      @count += 1
    end
  end
end
