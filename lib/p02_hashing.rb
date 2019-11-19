class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    each_with_index.inject(0) do |hash_acc, (el, idx)|
      hash_acc ^ (el.hash + idx.hash)
    end
  end
end

class String
  def hash
    self.split("").map(&:ord).hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    self.sort.hash
  end
end
