require_relative 'node'

class Graph

  def initialize
    @bacon_number = 0
    @checked_actors = []
    @path_array = []
  end

  def find_kevin_bacon(start)
    @checked_actors.push(start)

    return @path_array if start.name == 'Kevin Bacon'

    while @checked_actors.length != 0 do
      node = @checked_actors.shift()

      node.film_actor_hash.each do |film, cast|
        @path_array.push(film) unless @path_array.include?(film)
        cast.each do |actor|
          if actor.name != "Kevin Bacon" && !@checked_actors.include?(actor)
            @checked_actors.push(actor)
          elsif actor.name == "Kevin Bacon"
            return @path_array
          end
        end

      end
    end

  end
end
# each actor is a node
# each edge is a film where both actors starred
#
# Graph type is Cyclical, Undirected, unweighted
#
# Kevin_Bacon.film_actor_hash['Footloose'] = [Lori_Singer, John_Lithgow, Dianne_Wiest, Chris_Penn, Sarah_Jessica_Parker, …]
