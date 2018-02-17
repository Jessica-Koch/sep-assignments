require_relative 'hash_item'
class HashClass

  def initialize(size)
    items = Array.new(size)

    @items = items
    @items
  end

  def []=(key, value)
    len = @items.size

    i = index(key, len)

    if @items[i] != nil
      if @items[i][1] == value
        value = @items[i][1]
        return value

      elsif
        @items[i][1] != value && @items[i][0] == key
        resize
      end

    else
      @items[i] = [key, value]
    end

  end


  def [](key)
    k = index(key, size)

    @items[k][1]
  end

  def resize
    @items= @items.clone + @items
    @items
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    key.sum % size
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
