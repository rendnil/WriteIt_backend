require 'faker'
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

User.destroy_all
Post.destroy_all

puts "making users"

    User.create(username:"a", password:"a")
    User.create(username:"b", password:"a")
    User.create(username:"c", password:"a")
    User.create(username:"d", password:"a")
    User.create(username:"e", password:"a")

puts "done making users"
  20.times do
    Post.create(user_id: User.all.sample.id, title:Faker::GreekPhilosophers.quote, content:Faker::FamousLastWords.last_words, upvotes:rand(100), downvotes:rand(100))
  end



puts "making posts"
puts "done making posts"
