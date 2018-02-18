require_relative 'linked_list'

class SeparateChaining
  attr_reader :max_load_factor

  def initialize(size)
    @size = size
    @max_load_factor = 0.7
    @items = Array.new(@size)
  end

  def []=(key, value)
    i = index(key, @size)

    if @items[i] == nil
      @items[i] = [key, value]
    else
      @items[i].push([key, value])
    end
  end

  def [](key)
    i = index(key, @size)
    @items[i][1]
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
    sub_arrays = 0
    @items = @items.compact
    @items.map do |row|
      if row != nil
        sub_arrays = sub_arrays + row.length
      end
    end

    if size == 0
      return 0
    else
      sub_arrays / size
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
