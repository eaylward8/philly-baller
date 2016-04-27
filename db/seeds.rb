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

lb = User.create(first_name: "Larry", last_name: "Bird")
mj = User.create(first_name: "Michael", last_name: "Jordan")
sp = User.create(first_name: "Scottie", last_name: "Pippen")
dr = User.create(first_name: "Dennis", last_name: "Rodman")

mj.friends << sp
mj.friends << dr
sp.friends << dr