require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
    items = Array.new(@size)
    @items = items

  end

  def []=(key, value)
    i = index(key, size)

    if @items[i] == nil
      @items[i] = [key, value]
    elsif next_open_index(i) == -1
      resize
    elsif next_open_index(i) != -1
      new_index = next_open_index(i)
      @items[new_index] = [key, value]

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

  # Given an index, find the next open index in @items
  def next_open_index(index)
    while index < @size
      if @items[index] == nil
        return index
      end
      index += 1
    end
    # array is full
    index = -1
    index
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

  # Resize the hash
  def resize
    arr = Array.new(@size)
    @items = @items.clone + arr

    @items
  end

end
