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
    max = @items.pop
    bubble_down(0)
    max
  end


  def print(children=nil)

    @items.each do |i|
      puts "#{i.title}: #{i.rating}"
    end
  end

  def swap(source, target)
    @items[source], @items[target] = @items[target], @items[source]
  end

  def bubble_down(index)
    child_index = (index * 2)

    return if child_index > @items.size - 1

    not_the_last_item = child_index <= @items.size - 1
    left_item = @items[child_index]
    right_item = @items[child_index + 1]
    child_index += 1 if not_the_last_item && right_item.rating > left_item.rating

    return if @items[index].rating <= @items[child_index].rating

    swap(index, child_index)

    bubble_down(child_index)
  end

  def bubble_up(index)
    parent_index = (index / 2)

    # return if we reach the root element
    return if index <= 0

    return if @items[parent_index].rating <= @items[index].rating

    swap(index, parent_index)
    bubble_up(parent_index)
  end

end
