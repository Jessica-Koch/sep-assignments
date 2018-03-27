include RSpec
require_relative 'array'

RSpec.describe Array, type: Class do
  let(:arr) {[46, 12, 15, 16, 36, 3, 40, 37, 11, 47, 22, 45, 20, 26, 7, 39, 28, 9, 34, 24, 8, 44, 48, 5, 29, 42, 4, 27, 33, 32, 35, 1, 14, 25, 19, 38, 13, 41, 2, 43, 49, 18, 21, 10, 30, 6, 50, 17, 31, 23]}

  let(:arr2) {[2, 8, 5, 3, 9]}
  # let(:arr2) {[2, 8, 5, 3, 9, 1]}

  let(:short_array) {[13]}
  describe "Quick Sort" do
    it "returns itself if array has length 1 or less" do
      expect(short_array.quick_sort).to eq(short_array)
    end
    it "sorts an array of numbers" do
      sorted = arr.sort
      expect(arr.quick_sort).to eq(sorted)
    end
  end

  describe "Bucket Sort" do
    it "returns itself if array has length 1 or less" do
      expect(short_array.bucket_sort).to eq(short_array)
    end

    it "sorts an array of numbers" do
      sorted = arr.sort
      expect(arr.bucket_sort).to eq(sorted)
    end
  end

  describe "Heap Sort" do
    # it "returns itself if array has length 1 or less" do
    #   expect(heap_sort(short_array)).to eq(short_array)
    # end


    it "sorts an array of numbers" do
      sorted = arr2.sort.reverse
      expect(arr2.heap_sort).to eq(sorted)
    end
  end

  describe "Merge Sort" do
    it "returns itself if array has length 1 or less" do
      expect(short_array.merge_sort).to eq(short_array)
    end

    it "sorts an array of numbers" do
      sorted = arr.sort
      expect(arr.merge_sort).to eq(sorted)
    end
  end

  describe "Insertion Sort" do
    it "returns itself if array has length 1 or less" do
      expect(short_array.insertion_sort).to eq(short_array)
    end
    it "sorts an array of numbers" do
      sorted = arr.sort

      expect(arr.insertion_sort).to eq(sorted)
    end
  end

  describe "Bubble Sort" do
    it "returns itself if array has length 1 or less" do
      expect(short_array.bubble_sort).to eq(short_array)
    end

    it "sorts an array of numbers" do
      sorted = arr.sort

      expect(arr.bubble_sort).to eq(sorted)
    end
  end

  describe "Selection Sort" do
    it "returns itself if array has length 1 or less" do
      expect(short_array.selection_sort).to eq(short_array)
    end

    it "sorts an array of numbers" do
      sorted = arr.sort

      expect(arr.selection_sort).to eq(sorted)
    end
  end

  describe "Helper Functions" do
    describe "swap" do

      it "swaps array items" do
        @a = [1,4,2]
        @a.send(:swap, 0,1)
        swapped = [4, 1, 2]
        expect(@a).to eq(swapped)
      end
    end
  end
end
