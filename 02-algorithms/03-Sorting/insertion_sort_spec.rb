include RSpec
require_relative 'insertion_sort'

describe "Insertion Sort" do
  it "sorts array of numbers" do
    arr = [46, 12, 15, 16, 36, 3, 40, 37, 11, 47, 22, 45, 20, 26, 7, 39, 28, 9, 34, 24, 8, 44, 48, 5, 29, 42, 4, 27, 33, 32, 35, 1, 14, 25, 19, 38, 13, 41, 2, 43, 49, 18, 21, 10, 30, 6, 50, 17, 31, 23]

    sorted = arr.sort
    expect(insertion_sort(arr)).to eq(sorted)
  end
end
