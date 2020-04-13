require_relative "p01_int_set.rb"

class HashSet < ResizingIntSet
  
  def [](key)
    # optional but useful; return the bucket corresponding to `key`
    @store[key.hash % num_buckets]
  end

end