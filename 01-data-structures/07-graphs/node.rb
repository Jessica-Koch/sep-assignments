class Node
  attr_accessor :name
  attr_accessor :film_actor_hash
  attr_accessor :films

  def initialize(name)
    @name = name
    @film_actor_hash = Hash.new
    @films = []
  end

  def set_film(films)
    films.each do |film_title, starring_actors|
      starring_actors.each do |actor|
        if actor.name == @name

          @film_actor_hash[film_title] = starring_actors
          @film_actor_hash[film_title] == [actor]
        end
      end
    end
  end
end
