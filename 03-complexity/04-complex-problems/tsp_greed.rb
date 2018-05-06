def tsp_greed(cities, current_city)
  while current_city[:visited] == false
    neighbor_cities = current_city[:neighbors]
    next_city = neighbor_cities[0]

    neighbor_cities.each do |current_neighbor|
      town = cities.select{|city| city[:name] == current_neighbor[:name]}.first

      if current_neighbor[:distance] < next_city[:distance] && town[:visited] == false
        next_city = current_neighbor
      end
    end
    new_next_city = cities.select{|city| city[:name] == next_city[:name]}.first
    current_city[:visited] = true

    puts "current_city #{current_city}"
    puts "next_city: #{next_city}"
    tsp_greed(cities, new_next_city)
  end
  cities
end

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
    neighbors: [{name: 'B', distance: 2},{name: 'D', distance: 5}, {name: 'F', distance: 3}],
    visited: false
  },
  {
    name: 'D',
    neighbors: [
      {name: 'A', distance: 2},
      {name: 'C', distance: 5},
      {name: 'E', distance: 3},
      {name: 'F', distance: 4}
    ],
    visited: false
  },

  {
    name: 'E',
    neighbors: [
      {name: 'D', distance: 3},
    {name: 'F', distance: 2}],
    visited: false
  },
  {
    name: 'F',
    neighbors: [
      {name: 'A', distance: 1},
      {name: 'C', distance: 3},
      {name: 'D', distance: 4},
      {name: 'E', distance: 2}
    ],
    visited: false
  },
]


puts tsp_greed(cities, cities[0])
