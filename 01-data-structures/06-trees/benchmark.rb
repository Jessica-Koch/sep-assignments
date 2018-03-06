require 'benchmark'
require_relative 'binary_tree/binary_search_tree'
require_relative 'heap/heap'


tree_root = Node.new("tree root", 42)
heap_root = Node.new("heap root", 42)
tree = BinarySearchTree.new(tree_root)
heap = Heap.new()



n = 100000

Benchmark.bm(100) do |x|
  x.report("tree insert") do
    for i in 1..n do
      new_node = Node.new("tree", Random.rand(100000))
      tree.insert(tree_root, new_node)
    end
  end
  x.report("heap insert") do
    for i in 1..n do
      new_node = Node.new("heap", Random.rand(100000))
      heap.insert(new_node)
    end
  end
end

target = Node.new("target", 50000)
tree.insert(tree_root, target)
heap.insert( target)

Benchmark.bm(100) do |x|
  x.report("tree find") do
    tree.find(tree_root, 50000)
  end
  x.report("heap find") do
    heap.find( 50000)
  end
end

Benchmark.bm(100) do |x|
  x.report("tree delete") do
    tree.delete(tree_root, 50000)
  end
  x.report("heap delete") do
    heap.delete
  end
end
