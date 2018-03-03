require 'benchmark'
require_relative 'node'
require_relative 'heap'
require_relative 'binary_search_tree'

let(:heap) {Heap.new}
let(:tree){BinarySearchTree.new}

iterations =100_000
Benchmark.bm(13)do |bm|
  bm.report('Binary Search Tree insertion ') do

  end
  bm.report('Heap insertion') do

  end

  bm.report('Binary Search Tree find 50000') do

  end

  bm.report('Heap find 50000') do

  end


  bm.report('Binary Search Tree delete') do

  end

  bm.report('Heap delete') do

  end
end
