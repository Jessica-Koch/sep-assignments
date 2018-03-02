require_relative 'node'

class BinarySearchTree

  def initialize(root)
    @root = root
  end

  def insert(root, node)
    if @root.nil?
      return nil
    elsif root.rating < node.rating
      root.right.nil? ? (root.right = node) : insert(root.right, node)
    else
      root.left.nil? ? (root.left = node) : insert(root.left, node)
    end
  end

  # Recursive Depth First Search
  def find(root, data)
    if root.nil? || data.nil?
      return nil
    elsif root.title == data
      return root
    elsif !root.left.nil? && root.right.nil?
      root = find(root.left, data)
    elsif root.left.nil? && !root.right.nil?
      root = find(root.right, data)
    end
  end


  def delete(root, data)
    if root.nil? || data.nil?
      return nil
    else
      node_to_delete = find(root, data)

      node_to_delete.nil? ? nil : (node_to_delete.title = nil && node_to_delete.rating = nil)
    end
  end

  # Recursive Breadth First Search
  def printf(children=nil)
    queue = [@root]
    result = []
    while queue.length > 0
      root = queue.shift
      if root.left != nil
        queue.push(root.left)
      end
      if root.right != nil
        queue.push(root.right)
      end
      result.push("#{root.title}: #{root.rating}")
    end
    result.each {|node| puts node}
  end
end
