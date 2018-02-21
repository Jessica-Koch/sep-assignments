require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = Node.new(root.title, root.rating)
    @right = nil
    @left = nil
  end

  def insert(root, node)
    puts "node #{node.title}"
    if (root.left == nil)
      root.left = node
      @left = root.left
    elsif root.left != nil && root.right == nil
      root.right = node
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    return nil if data.nil?
    temp = root
    if root.title == data
      puts 'It is the root!'
      return root
    else
      # puts "left root: #{root.left}"
      # puts "right root: #{root.right}"
    end
    # puts "root: #{root.title}"
    puts "data: #{data}"
  end

  def delete(root, data)
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    children.each do |child|
      puts "child #{child}"
    end
  end
end
