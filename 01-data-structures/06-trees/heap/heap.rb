require_relative 'node'
class Heap
  attr_reader :items

  def initialize
    @items = []
  end

  def insert(node)
    @items.push(node)

    bubble_up(@items.size - 1)
  end

  def find(data)
    return nil if (@items.nil? || data.nil?)

    @items.each do |i|
      if i.title == data
        return i
      end
    end
  end

  def delete
    swap(1, @items.size - 1)
    last_item = @items.pop
    bubble_down(0)
    last_item
  end


  def print(children=nil)

    @items.each do |i|
      puts "#{i.title}: #{i.rating}"
    end
  end

  def swap(a, b)
    temp = @items[a]
    @items[a] = @items[b]
    @items[b] = temp
  end

  def bubble_down( index)
    root = @items[0]
    child_index = (index * 2)
    l = child_index + 1
    r = child_index + 2
    not_the_last_element = child_index < @items.size - 1

    if l < @items.size && @items[l].rating < root.rating
      swap(l, 0)
      bubble_up(@items.size - 1)
    end

    if r < @items.size && @items[r].rating < root.rating
      swap(r, 0)
      bubble_up(@items.size - 1)
    end
    child_index += 1 if not_the_last_element && @items[r].rating > @items[l].rating

    if @items[0] != @items[index]
      swap(index, 0)
    end

  end

  def bubble_up(index)
    parent_index = (index / 2)

    # return if we reach the root element
    return if @items[parent_index].rating <= @items[index].rating
    swap(index, parent_index)

    bubble_up(parent_index)
  end


end
