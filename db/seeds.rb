# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

artjson = Art.get_json
  # venues = Venue.create([{ name: 'SFMOMA'}, { name: 'Brooklyn Museum'}])
  # Art.create(title: 'The Dancing Musicians', artist: 'Joan Brown', medium: 'bronze')

Art.all.each do |art|
artjson = eval(art.title)
art.update( title: artjson ["title"], artist: artjson ["artist"], medium: artjson ["medium"] )
end
