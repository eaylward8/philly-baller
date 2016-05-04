# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

require 'database_cleaner'

DatabaseCleaner.strategy = :truncation, {except: %w[courts]}
DatabaseCleaner.clean

g1 = Game.create(description: "Friendly Pickup", court_id: 1, date: Date.today, time: "13:00")
g2 = Game.create(description: "Streetball", court_id: 2, date: Date.today + 2, time: "18:30")
g3 = Game.create(description: "Jail Ball", court_id: 3, date: Date.today + 7, time: "11:00")
g4 = Game.create(description: "3v3 Half Court", court_id: 4, date: Date.today - 1, time: "9:30")
g5 = Game.create(description: "Ball is Lyfe", court_id: 5, date: Date.today - 5, time: "20:00")

mj = User.create(first_name: "Michael", last_name: "Jordan", skill_level: 5, email: "mj@gmail.com", password: "11111")
sp = User.create(first_name: "Scottie", last_name: "Pippen", skill_level: 5, email: "scottie@gmail.com", password: "11111")
ai = User.create(first_name: "Allen", last_name: "Iverson", skill_level: 5, email: "answer@gmail.com", password: "11111")
tm = User.create(first_name: "Todd", last_name: "McCullough", skill_level: 3, email: "tmac@gmail.com", password: "11111")

mj.friends << sp
ai.friends << tm

mj.games.push(g1, g2, g4)
sp.games.push(g1, g2)
ai.games.push(g1, g3, g5)
tm.games.push(g2, g3, g5)

