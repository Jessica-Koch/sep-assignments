require 'benchmark'
require_relative 'node'
require_relative 'heap'
require_relative 'binary_search_tree'

let(:heap) {Heap.new}
let(:tree){BinarySearchTree.new}
let (:root) { Node.new("The Matrix", 87) }

Benchmark.bm(13)do |bm|
  bm.report('Binary Search Tree insertion ') do
    (1..100_000).each{|i| tree.insert(root, Node.new("#{i}", i))}
  end
  bm.report('Heap insertion') do
    (1..100_000).each{|i| heap.insert(Node.new("#{i}", i))}
  end

  bm.report('Binary Search Tree find 50000') do
    (1..100_000).each{|i| tree.find(root, "50000")}
  end

  bm.report('Heap find 50000') do
    (1..100_000).each{|i| heap.find("50000")}
  end


  bm.report('Binary Search Tree delete') do
    (1..100_000).each{|i| tree.delete(root, "50000")}
  end

  bm.report('Heap delete') do
    (1..100_000).each{|i| Heap.delete}
  end
end
