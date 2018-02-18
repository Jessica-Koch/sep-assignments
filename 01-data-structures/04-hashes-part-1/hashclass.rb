require_relative 'hash_item'
class HashClass

  def initialize(size)
    items = Array.new(size)

    @items = items
  end

  def []=(key, value)
    hash_item = HashItem.new(key, value)
    if @items[index(key, size)] && @items[index(key, size)].value != value
      resize
      @items[index(key, size)] = hash_item
    else
      @items[index(key, size)] = hash_item
    end
  end

  def [](key)
    @items[index(key, size)].value
  end

  def resize
    old_arr = @items
    @items = Array.new(@items.size * 2)

    old_arr.each do |item|
      if item != nil
        @items[index(item.key, size)] = item
      end
    end
  end

  # Returns a unique, deterministically reproducible index into an array
  # We are hashing based on strings, let's use the ascii value of each string as
  # a starting point.
  def index(key, size)
    if @items[key.sum % size] && @items[key.sum % size].key != key # if there is a collision, call resize fxn again
      resize
      key.sum % size
    else
      key.sum % size
    end
  end

  # Simple method to return the number of items in the hash
  def size
    @items.length
  end

end
