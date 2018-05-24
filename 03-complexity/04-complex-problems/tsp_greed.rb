require 'pry'

class City
  attr_accessor :name, :visited, :neighbors
  def initialize(name)
    @name = name
    @visited = false
    @neighbors = []
  end

  def add_neighbor(city, distance)
    @neighbors << {city: city, distance: distance}
  end
end

visited_cities=[]

def tsp_greed(cities, current_city, visited_cities)
  while !visited_cities.include?(current_city.name)
    neighbor_cities = current_city.neighbors

    # puts "next_city: outside loop #{next_city}"
    next_city = neighbor_cities[0]
    neighbor_cities.each do |current_neighbor|

      if (current_neighbor[:distance] < next_city[:distance] &&  !visited_cities.include?(current_neighbor[:city].name)) || visited_cities.include?(next_city[:city].name)
        next_city = current_neighbor
      else
        next_city = next_city
      end
    end
    visited_cities.push(current_city.name)
    current_city = next_city[:city]
    tsp_greed(cities, current_city, visited_cities)
  end
  return visited_cities
end

cityA = City.new('A')
cityB = City.new('B')
cityC = City.new('C')
cityD = City.new('D')
cityE = City.new('E')
cityF = City.new('F')

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


cities = [cityA, cityB, cityC, cityD, cityE, cityF]

tsp_greed(cities, cityA, visited_cities)
