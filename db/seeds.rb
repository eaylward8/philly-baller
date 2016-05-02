# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation
DatabaseCleaner.clean

g1 = Game.create(court_id: 1, datetime: "2016-05-03 12:00:00")

mj = User.create(first_name: "Michael", last_name: "Jordan", skill_level: 5, email: "mj@gmail.com", password: "11111")
sp = User.create(first_name: "Scottie", last_name: "Pippen", skill_level: 5, email: "scottie@gmail.com", password: "11111")
ai = User.create(first_name: "Allen", last_name: "Iverson", skill_level: 5, email: "answer@gmail.com", password: "11111")

mj.friends << sp

mj.games << g1
sp.games << g1
ai.games << g1
