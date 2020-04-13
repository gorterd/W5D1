class Integer
  # Integer#hash already implemented for you
end
#"10010"
#

class Array
  def hash
    #convert array to printable string using #inspect
    inspected_str = self.inspect
    #calling
    inspected_str.hash
  end
end

class String
  def hash
    # getting bytes of chars in sting
    bytes_arr = self.bytes
    # joining array of bytes to form a string and converting it to integer
    joined_i = bytes_arr.join.to_i
    # calling integer hash method
    joined_i.hash
  end
end

class Hash
  # This returns 0 because rspec will break if it returns nil
  # Make sure to implement an actual Hash#hash method
  def hash
    array = self.sort_by{|k,v| v.inspect}
    array.hash
  end
end
