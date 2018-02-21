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
    if @items[index(key, @size)] && @items[index(key, @size)].head.value == value
      @items[index(key, @size)].add_to_tail(node)
      @node_count = @node_count + 1


    elsif @items[index(key, @size)] && @items[index(key, @size)].head.key != key
      # puts "elsif #{@items}"
      # puts '================================================'
      resize
      @items[index(key, @size)].add_to_tail(node)
      @node_count = @node_count + 1


    else
      # puts "else #{@items}"
      # puts '================================================'

      @items[index(key, @size)] = LinkedList.new
      @items[index(key, @size)].add_to_front(node)
      @node_count = @node_count + 1

    end
  end

  def [](key)
    i = index(key, @size)
    @items[index(key, size)].tail.value
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
    new_chain = @items + Array.new(@size)
    # puts "resizing hash"
    @items.each do |linked_list|
      #   # puts linked_list == nil
      #   # if linked_list == nil
      #   #   puts new_chain.methods
      #   # elsif linked_list
      # puts "linked_list: #{linked_list}"
      #   #
      #   # end
      #
      #   # first_node = linked_list.head
      #   # puts "first_node key: #{first_node.key}"
    end
    # puts "Hash resized"
  end

end
