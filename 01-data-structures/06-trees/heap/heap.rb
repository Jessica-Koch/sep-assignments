require_relative 'node'

class Heap
  def initialize
    @elements = [nil]
  end

  def insert(node)
    @elements << node
    bubble_up(@elements.size - 1)
  end

  def bubble_up(index)
    parent_index = (index / 2)

    return if index <= 1

    return if @elements[parent_index] <= @elements[index]
    swap(index, parent_index)

    bubble_up(parent_index)
  end

  def swap(root, target)
    @elements[root], @elements[target] = @elements[target], @elements[root]
  end

  def find(root, data)
  end

  def delete
    swap(1, @elements.size - 1 )

    min = @elements.shift
    bubble_down(1)
    min
  end

  def print(children=nil)
    @elements.each {|i| puts "#{i.title}: #{i.rating}"}
  end
end
