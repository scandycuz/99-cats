# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Cat.create!(name: 'Harold', birth_date: "2015/01/20", color: 'brown', sex: "M", description: "This cat is fluffy.")
Cat.create!(name: 'Snuggles', birth_date: "2014/02/18", color: 'grey', sex: "F", description: "A grey cat.")
