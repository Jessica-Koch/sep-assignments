require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @max_load_factor = 0.7
    @items = Array.new(size)
    @node_count = 0
  end

  def []=(key, value)
    i = index(key, @size)
    node = Node.new(key, value)
    @items[i] ||= LinkedList.new
    @items[i].add_to_front(node)
    @node_count += 1
    resize if load_factor > max_load_factor
  end

  def [](key)
    i = index(key, @size)
    @items[i].head.value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    buckets = @size
    lf = @node_count.to_f / buckets.to_f

    lf.to_f
  end

  # Simple method to return the number of items in the hash
  def size
    @items.size
  end

  # Resize the hash
  def resize
    old_arr = @items
    @size = @size * 2
    @items = Array.new(@size)
    old_arr.each do |item|
      if item != nil

        @items[index(item.head.key, @size)] = item
      end
    end
    @items
  end

end
