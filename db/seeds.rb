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

# g1 = Game.create(description: "Pickup", court_id: 1, date: Date.today, time: "13:00")
# g2 = Game.create(description: "Streetball", court_id: 2, date: Date.today + 2, time: "18:30")
# g3 = Game.create(description: "Late morning hoops", court_id: 3, date: Date.today + 7, time: "11:00")
# g4 = Game.create(description: "3v3 Half Court", court_id: 4, date: Date.today - 1, time: "9:30")
# g5 = Game.create(description: "Ball is Life", court_id: 5, date: Date.today - 5, time: "20:00")

30.times do 
  Game.create(description: Faker::Lorem.word.capitalize + " #{["Basketball", "Pickup", "Streetball"].sample}", court_id: rand(1..205), date: Faker::Time.between(7.days.ago, Date.today + 7), time: "#{rand(6..20)}:#{[0, 30].sample}")
end

mj = User.create(first_name: "Michael", last_name: "Jordan", skill_level: 5, email: "mj@gmail.com", password: "11111")
sp = User.create(first_name: "Scottie", last_name: "Pippen", skill_level: 4, email: "scottie@gmail.com", password: "11111")
ai = User.create(first_name: "Allen", last_name: "Iverson", skill_level: 4, email: "answer@gmail.com", password: "11111")
tm = User.create(first_name: "Todd", last_name: "McCullough", skill_level: 2, email: "tmac@gmail.com", password: "11111")
am = User.create(first_name: "Aaron", last_name: "McKie", skill_level: 2, email: "mckie@gmail.com", password: "11111")
dr = User.create(first_name: "Dennis", last_name: "Rodman", skill_level: 3, email: "worm@gmail.com", password: "11111")
js = User.create(first_name: "John", last_name: "Stockton", skill_level: 4, email: "john@gmail.com", password: "11111")
km = User.create(first_name: "Karl", last_name: "Malone", skill_level: 4, email: "mailman@gmail.com", password: "11111")
so = User.create(first_name: "Shaquille", last_name: "O'Neal", skill_level: 4, email: "shaqdiesel@gmail.com", password: "11111")
ph = User.create(first_name: "Penny", last_name: "Hardaway", skill_level: 3, email: "penny@gmail.com", password: "11111")

mj.friends.push(sp, dr)
ai.friends.push(tm, am)
js.friends.push(km)
so.friends.push(ph)

User.all.each do |user|
  user.games.push(Game.all.sample(rand(5..10)))
end



