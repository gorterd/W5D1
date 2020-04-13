
class Node
  attr_reader :key
  attr_accessor :val, :next, :prev

  def initialize(key = nil, val = nil)
    @key = key
    @val = val
    @next = nil
    @prev = nil
  end

  def to_s
    "#{@key}: #{@val}"
  end

  def remove
    # optional but useful, connects previous link to next link
    # and removes self from list.
  end
end


class LinkedList

  include Enumerable

  def initialize
    @head = Node.new
    @tail = Node.new
    @head.next = @tail
    @tail.prev = @head
  end

  def [](i)
    each_with_index { |link, j| return link if i == j }
    nil
  end

  def first
    @head.next
  end

  def last
    @tail.prev
  end

  def empty?
    @head.next == @tail
  end

  def get(key)
    self.each do |node|
      if node.key == key
        return node.val
      end
    end
  end

  def include?(key)
    self.each do |node|
      return true if node.key == key
    end

    false
  end

  def append(key, val)
    new_node = Node.new(key, val)
    add(new_node)   
  end

  def update(key, val)
    self.each do |node|
      if node.key == key
        node.val = val 
        break
      end
    end
  end

  def remove(key)
    self.each do |node|
      if node.key == key
        eject(node)
        break
      end
    end
  end

  def each
    current_node = self.first

    until current_node == @tail
      yield current_node
      current_node = current_node.next
    end
  end

  def to_s
    inject([]) { |acc, link| acc << "[#{link.key}, #{link.val}]" }.join(", ")
  end

  def eject(node)
    node.prev.next = node.next
    node.next.prev = node.prev
  end

  private

  def add(node)
    last = @tail.prev
    last.next = node
    @tail.prev = node 
    node.prev = last
    node.next = @tail   
  end

end
