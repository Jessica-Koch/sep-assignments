include RSpec
require_relative "quick_sort"

RSpec.describe Array, type: Class do
  let(:arr) {[46, 12, 15, 16, 36, 3, 40, 37, 11, 47, 22, 45, 20, 26, 7, 39, 28, 9, 34, 24, 8, 44, 48, 5, 29, 42, 4, 27, 33, 32, 35, 1, 14, 25, 19, 38, 13, 41, 2, 43, 49, 18, 21, 10, 30, 6, 50, 17, 31, 23]}

  describe "Quick Sort" do
    describe "quick_sort" do
      it "sorts an array of numbers" do
        sorted = arr.sort
        expect(arr.quick_sort).to eq(sorted)
      end
    end

    describe "swap" do
      it "swap array positions" do
        a = ['a', 'b']

        swapped_arr = a.swap(0, 1)

        expect(swapped_arr).to eq(['b', 'a'])
      end
    end
  end
end
