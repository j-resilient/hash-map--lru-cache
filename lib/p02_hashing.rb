class Integer
  # Integer#hash already implemented for you
end

class Array
  def hash
    hash = nil
    self.each_with_index do |el, idx|
      el_hash = el.hash ^ idx.hash
      hash = hash.nil? ? el_hash : (el.hash ^ hash ^ el_hash)
    end
    hash.hash
  end
end

class String
  def hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    0
  end
end
