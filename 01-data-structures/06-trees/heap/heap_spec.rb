include RSpec
require_relative 'heap'

RSpec.describe Heap, type: Class do
  let (:heap) { Heap.new }
  let (:root) { Node.new("The Matrix", 87) }
  let (:pacific_rim) { Node.new("Pacific Rim", 72) }
  let (:braveheart) { Node.new("Braveheart", 78) }
  let (:jedi) { Node.new("Star Wars: Return of the Jedi", 80) }
  let (:donnie) { Node.new("Donnie Darko", 85) }
  let (:inception) { Node.new("Inception", 86) }
  let (:district) { Node.new("District 9", 90) }
  let (:shawshank) { Node.new("The Shawshank Redemption", 91) }
  let (:martian) { Node.new("The Martian", 92) }
  let (:hope) { Node.new("Star Wars: A New Hope", 93) }
  let (:empire) { Node.new("Star Wars: The Empire Strikes Back", 94) }
  let (:mad_max_2) { Node.new("Mad Max 2: The Road Warrior", 98) }

  describe "#insert(data)" do
    it "properly inserts a new node as a root" do
      heap.insert(root)

      expect(heap.items[0].title).to eq "The Matrix"
    end

    it "properly inserts a new node" do
      heap.insert(hope)
      expect(heap.items[0].rating).to eq 93

      heap.insert(donnie)
      expect(heap.items[0].rating).to eq 85
      expect(heap.items[1].rating).to eq 93
      #
      heap.insert(inception) # 7
      expect(heap.items[0].rating).to eq 85
      expect(heap.items[1].rating).to eq 86
      expect(heap.items[2].rating).to eq 93

      heap.insert(pacific_rim) # 19
      expect(heap.items[0].rating).to eq 72
      expect(heap.items[1].rating).to eq 85
      expect(heap.items[2].rating).to eq 93
      expect(heap.items[3].rating).to eq 86

      heap.insert(jedi) # 1
      expect(heap.items[0].rating).to eq 72
      expect(heap.items[1].rating).to eq 80
      expect(heap.items[2].rating).to eq 93
      expect(heap.items[3].rating).to eq 86
      expect(heap.items[4].rating).to eq 85
    end
  end

  describe "#find(data)" do
    it "properly finds a node" do
      heap.insert(pacific_rim)
      heap.insert( braveheart)
      heap.insert( pacific_rim)
      heap.insert(shawshank)
      expect(heap.find(pacific_rim.title)).to eq pacific_rim
      expect(heap.find(braveheart.title)).to eq braveheart
    end
  end

  describe "#swap(source, target)" do
    it "properly swaps items" do
      heap.insert(inception)
      heap.insert(donnie) # 85

      expect(heap.items[0].title).to eq "Donnie Darko"
      expect(heap.items[1].title).to eq "Inception"
      heap.swap(1, 0)
      expect(heap.items[1].title).to eq "Donnie Darko"
      expect(heap.items[0].title).to eq "Inception"
    end
  end

  describe "#delete" do
    it "properly deletes a node" do
      heap.insert( hope) # 93
      heap.insert(inception) # 86
      heap.insert(donnie) # 85
      expect(heap.delete).to eq donnie
    end

  end

  describe "#print" do
    specify {
      expected_output = "Pacific Rim: 72\nBraveheart: 78\nStar Wars: Return of the Jedi: 80\nThe Matrix: 87\nDistrict 9: 90\nStar Wars: The Empire Strikes Back: 94\nInception: 86\nStar Wars: A New Hope: 93\nThe Shawshank Redemption: 91\nThe Martian: 92\nMad Max 2: The Road Warrior: 98\n"
      heap.insert(hope) # 93
      heap.insert(empire)
      heap.insert(jedi)
      heap.insert(martian)
      heap.insert(pacific_rim)
      heap.insert(inception) # 86
      heap.insert(braveheart)
      heap.insert(shawshank)
      heap.insert(district) # 90
      heap.insert(mad_max_2) # 98
      expect { heap.print }.to output(expected_output).to_stdout
    }
  end
end
