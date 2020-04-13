class MaxIntSet
  attr_reader :store

  def initialize(max)
    @store  = Array.new(max, false)
    @max = max
  end

  def insert(num)
    raise "Out of bounds"  unless is_valid?(num)
    @store[num] = true
  end

  def remove(num)
    @store[num] = false
  end

  def include?(num)
    @store[num]
  end

  private

  def is_valid?(num)
    num < @max && num >= 0
  end

  # def validate!(num)
  # end
end




class IntSet
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
  end

  def insert(num)
    self[num] << num unless self.include?(num)
  end
  
  def remove(num)
    self[num].delete(num) if self.include?(num)
  end
  
  def include?(num)
    self[num].include?(num)
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end
  
  def num_buckets
    @store.length
  end
end

class ResizingIntSet
  attr_reader :count
  
  def initialize(num_buckets = 20)
    @store = Array.new(num_buckets) { Array.new }
    @count = 0
  end
  
  def insert(num)
    if @count < num_buckets
      unless self.include?(num)
        self[num] << num 
        @count += 1
      end
    else
      resize!
      insert(num)
    end
  end
  
  def remove(num)
    if self.include?(num)
      self[num].delete(num)
      @count-=1
    end
  end
  
  def include?(num)
    self[num].include?(num)
  end
  
  private
  
  def [](num)
    # optional but useful; return the bucket corresponding to `num`
    @store[num % num_buckets]
  end

  def num_buckets
    @store.length
  end

  def resize!
    new_array = Array.new(num_buckets * 2) { Array.new }
    @store.each do |bucket|
      bucket.each do |ele|
        new_index = ele % (num_buckets * 2)
        new_array[new_index] << ele
      end
    end
    @store = new_array
  end
end
