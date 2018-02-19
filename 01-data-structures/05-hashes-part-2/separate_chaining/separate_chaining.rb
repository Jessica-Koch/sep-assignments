require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @max_load_factor = 0.7
    @items = Array.new(@size)
    @sub_arrays = 0
  end

  def []=(key, value)
    linked_list = LinkedList.new
        if @items[index(key, @size)] == nil
      @items[index(key, @size)].value = [key, value]
    else
      @items[index(key, @size)].push([key, value])
    end
  end

  def [](key)
    @items[index(key, @size)].value
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Calculate the current load factor
  def load_factor
    if size == 0
      return 0
    else
      @sub_arrays.to_f / size.to_f
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    @items = @items.clone + @items
    @items
  end
end
