# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

  art_json = Art.get_json

  Art.all.each do |art|
    art_json = eval(art.title)
    art.update( title: art_json ["title"], artist: art_json ["artist"], medium: art_json ["medium"] )
  end
