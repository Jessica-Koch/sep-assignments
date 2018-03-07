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

  def delete(data)
    idx = find_index(data.title)

    swap(idx, @items.size - 1)
    @items.delete_at(@items.size - 1)
    bubble_down(idx)

  end

  def find_index(data)
    idx = 0
    @items.each do |i|
      break if i.title == data

      idx+=1
    end
    idx
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
    l = child_index
    r = child_index + 1
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
      bubble_up(@items.size - 1)
    end

  end

  def bubble_up(index)
    parent_index = (index / 2)

    return if index <= 0
    # return if we reach the root element
    return if @items[index].rating >= @items[parent_index].rating
    swap(index, parent_index)

    bubble_up(parent_index)
  end


end
