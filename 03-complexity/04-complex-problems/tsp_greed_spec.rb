include RSpec
require_relative "tsp_greed"


describe "tsp_greed" do
  let(:cities){ Array.new }
  let(:cityA){ City.new('A')}
  let(:cityB){ City.new('B')}
  let(:cityC){ City.new('C')}
  let(:cityD){ City.new('D')}
  let(:cityE){ City.new('E')}
  let(:cityF){ City.new('F')}

  before do

    cityA.add_neighbor(cityB, 3)
    cityA.add_neighbor(cityD, 2)
    cityA.add_neighbor(cityF, 1)

    cityB.add_neighbor(cityA, 3)
    cityB.add_neighbor(cityC, 2)

    cityC.add_neighbor(cityB, 2)
    cityC.add_neighbor(cityD, 5)
    cityC.add_neighbor(cityF, 3)

    cityD.add_neighbor(cityA, 2)
    cityD.add_neighbor(cityC, 5)
    cityD.add_neighbor(cityE, 3)
    cityD.add_neighbor(cityF, 4)

    cityE.add_neighbor(cityD, 3)
    cityE.add_neighbor(cityF, 2)

    cityF.add_neighbor(cityA, 1)
    cityF.add_neighbor(cityC, 3)
    cityF.add_neighbor(cityD, 4)
    cityF.add_neighbor(cityE, 2)


    cities.push(cityA, cityB, cityC, cityD, cityE, cityF)
  end

  it "visits city A" do
    expect(cityB.visited).to eq(true)
  end

  it "visits city B" do
    expect(cityB.visited).to eq(true)
  end

  it "visits city C" do
    expect(cityC.visited).to eq(true)
  end

  it "visits city D" do
    expect(cityD.visited).to eq(true)
  end

  it "visits city E" do
    expect(cityE.visited).to eq(true)
  end

  it "visits city F" do
    expect(cityF.visited).to eq(true)
  end
end
