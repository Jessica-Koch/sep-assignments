include RSpec
require_relative "tsp_greed"



describe "tsp_greed" do
  cities = [
    {
      name: 'A',
      neighbors: [
        {name: 'B', distance: 3}, {name: 'D',distance: 2}, {name: 'F', distance: 1}
      ],
      visited: false
    },
    {
      name: 'B',
      neighbors: [{name: 'A', distance: 3}, {name: 'C', distance: 2}],
      visited: false
    },
    {
      name: 'C',
      neighbors: [{name: 'B', distance: 2}, {name: 'F', distance: 3}],
      visited: false
    },
    {
      name: 'D',
      neighbors: [{name: 'A', distance: 2}, {name: 'E', distance: 3}, {name: 'F', distance: 4}],
      visited: false
    },

    {
      name: 'E',
      neighbors: [{name: 'D', distance: 3}, {name: 'F', distance: 2}],
      visited: false
    },
    {
      name: 'F',
      neighbors: [{name: 'A', distance: 1}, {name: 'C', distance: 3}, {name: 'D', distance: 4}, {name: 'E', distance: 2}],
      visited: false
    },
  ]

  visited_cities = tsp_greed(cities, cities[0])
  it "visits city A" do
    expect(visited_cities[0][:visited]).to eq(true)
  end

  it "visits city B" do
    expect(visited_cities[1][:visited]).to eq(true)
  end

  it "visits city C" do
    expect(visited_cities[2][:visited]).to eq(true)
  end

  it "visits city D" do
    expect(visited_cities[3][:visited]).to eq(true)
  end

  it "visits city E" do
    expect(visited_cities[4][:visited]).to eq(true)
  end

  it "visits city F" do
    expect(visited_cities[5][:visited]).to eq(true)
  end
end
