include RSpec

require_relative 'node'
require_relative 'graph'

RSpec.describe Graph, type: Class do
  let (:film_hash) {Hash.new}

  let (:graph) {Graph.new}
  let (:kevin_bacon) { Node.new('Kevin Bacon') }
  let (:lori_singer) { Node.new('Lori Singer') }
  let (:john_lithgow) { Node.new('John Lithgow')}
  let (:dianne_wiest) { Node.new('Dianne Wiest')}
  let (:chris_penn) { Node.new('Chris Penn')}
  let (:nicolas_cage) { Node.new('Nicolas Cage')}
  let (:wendell_pierce) { Node.new('Wendell Pierce')}
  let (:sarah_jessica_parker) { Node.new('Sarah Jessica Parker')}
  let (:clark_gregg) { Node.new('Clark Gregg')}
  let (:nicole_kidman) { Node.new('Nicole Kidman')}
  let (:anthony_hopkins) { Node.new('Anthony Hopkins')}
  let (:brendan_fraser) { Node.new('Brendan Fraser')}
  let (:hope_davis) { Node.new('Hope Davis')}
  let (:gwyneth_paltrow) { Node.new('Gwyneth Paltrow')}
  let (:jake_gyllenhaal) { Node.new('Jake Gyllenhaal')}
  let (:julia_roberts) { Node.new('Julia Roberts')}

  before do
    film_hash['Footloose'] = [kevin_bacon, lori_singer, john_lithgow, dianne_wiest, chris_penn, sarah_jessica_parker]
    film_hash['It Could Happen to You'] = [nicolas_cage, wendell_pierce]
    film_hash['Sleepers'] = [kevin_bacon, wendell_pierce]
    film_hash['The Human Stain'] = [anthony_hopkins, nicole_kidman, clark_gregg]
    film_hash['The Air I Breathe'] = [clark_gregg, kevin_bacon, brendan_fraser]
    film_hash['Proof'] = [anthony_hopkins, hope_davis, gwyneth_paltrow, jake_gyllenhaal]
    film_hash['Flatliners'] = [kevin_bacon, hope_davis, julia_roberts]

    kevin_bacon.set_film(film_hash)
    lori_singer.set_film(film_hash)
    john_lithgow.set_film(film_hash)

    dianne_wiest.set_film(film_hash)
    chris_penn.set_film(film_hash)
    nicolas_cage.set_film(film_hash)
    wendell_pierce.set_film(film_hash)
    sarah_jessica_parker.set_film(film_hash)
    clark_gregg.set_film(film_hash)
    nicole_kidman.set_film(film_hash)
    anthony_hopkins.set_film(film_hash)
    brendan_fraser.set_film(film_hash)
    hope_davis.set_film(film_hash)
    gwyneth_paltrow.set_film(film_hash)
    jake_gyllenhaal.set_film(film_hash)
    julia_roberts.set_film(film_hash)

  end
  describe "it finds the actor that was passed" do
    it "finds Nicolas Cage" do
      paths = ['It Could Happen to You', 'Sleepers']
      expect(graph.find_kevin_bacon(nicolas_cage)).to eq(paths)
    end

    it "finds Anthony Hopkins" do
      paths = ['Flatliners', 'Proof']
      expect(graph.find_kevin_bacon(anthony_hopkins)).to eq(paths)
    end

    it "finds Nicole Kidman" do
      paths = [ 'The Human Stain', 'The Air I Breath']
      expect(graph.find_kevin_bacon(nicole_kidman)).to eq(paths)
    end

    it "finds Kevin Bacon" do
      paths = []
      expect(graph.find_kevin_bacon(kevin_bacon)).to eq(paths)
    end
  end
end
