require_relative 'node'

class OpenAddressing
  def initialize(size)
    @size = size
    @items = Array.new(@size)
  end

  def []=(key, value)
    node = Node.new(key, value)
    if @items[index(key, @size)] != nil # our index is full
      if next_open_index(index(key, @size)) == -1
        resize
        @items[index(key, @size)] = node
      elsif next_open_index(index(key, @size)) != -1
        new_index = next_open_index(index(key, @size))
        @items[new_index] = node
        node
      else
        puts "some else case i am missing"
      end

    else # our index is empty
      @items[index(key, @size)] = node
    end
  end

  def [](key)
    index = index(key, @size)
    current_index = index

    while current_index < @size || current_index != index
      if @items[current_index].key == key
        break
      elsif current_index + 1 == @size
        current_index = 0
      else
        current_index += 1
      end
    end
    return @items[current_index].value

  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Given an index, find the next open index in @items
  def next_open_index(index)
    open_index = nil
    current_index = index

    if index >= @size
      open_index = index - 1
    end

    while current_index < @size
      if current_index <= @size and @size < 2
        open_index = -1
        break
      elsif @items[current_index] == nil
        open_index = current_index
        break
      elsif current_index + 1 == @size
        current_index = 0
      elsif current_index + 1 == index
        open_index = -1
        break
      else
        current_index += 1
      end
    end
    open_index
  end

  # Simple method to return the number of items in the hash
  def size
    @size
  end

  # Resize the hash
  def resize
    old_arr = @items
    @size = @size * 2
    @items = Array.new(@size)
    old_arr.each do |item|
      if item != nil
        @items[index(item.key, @size)] = item
      end
    end
    @items
  end

end
