require_relative 'p04_linked_list'

class HashMap
  include Enumerable

  attr_accessor :count

  def initialize(num_buckets = 8)
    @store = Array.new(num_buckets) { LinkedList.new }
    @count = 0
  end

  def include?(key)
    bucket(key).include?(key)
  end

  def set(key, val)
    resize! unless @count < num_buckets
    list = bucket(key)

    if list.include?(key)
      list.update(key, val)
    else
      list.append(key, val)
      @count += 1
    end
  end

  def get(key)
    bucket(key).get(key)
  end

  def delete(key)
    @count -= 1 if bucket(key).remove(key)
  end

  def each
    @store.each do |bucket|
      bucket.each { |node| yield( [node.key, node.val] ) } unless bucket.empty?
    end
  end

  # uncomment when you have Enumerable included
  def to_s
    pairs = inject([]) do |strs, (k, v)|
      strs << "#{k.to_s} => #{v.to_s}"
    end
    "{\n" + pairs.join(",\n") + "\n}"
  end

  alias_method :[], :get
  alias_method :[]=, :set

  private

  def num_buckets
    @store.length
  end

  def resize!
    pairs = []
    self.each { |k, v| pairs << [k, v] }
    @store = Array.new(@count * 2) { LinkedList.new }
    @count = 0
    pairs.each { |k, v| set(k, v) }
  end

  def bucket(key)
    # optional but useful; return the bucket corresponding to `key`
    @store[(key.hash % num_buckets)]
  end
end