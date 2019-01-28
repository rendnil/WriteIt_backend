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
Comment.destroy_all
Vote.destroy_all

puts "making users"

  user_a =  User.create(username:"a", password:"a")
    user_b =  User.create(username:"b", password:"a")
    user_c =  User.create(username:"c", password:"a")

puts "done making users"
puts "making posts"
  p1 = Post.create(author_id: user_a.id, title:Faker::GreekPhilosophers.quote, content:Faker::FamousLastWords.last_words)
  p2 = Post.create(author_id: user_b.id, title:Faker::GreekPhilosophers.quote, content:Faker::FamousLastWords.last_words)
  p3 = Post.create(author_id: user_b.id, title:Faker::GreekPhilosophers.quote, content:Faker::FamousLastWords.last_words)
  # 20.times do
  #   Post.create(author_id: User.all.sample.id, title:Faker::GreekPhilosophers.quote, content:Faker::FamousLastWords.last_words, upvotes:rand(100), downvotes:rand(100))
  # end

puts "done making posts"

puts "making comments"
  Comment.create(commenter_id:  user_a.id, post_id: p2.id, content:Faker::FamousLastWords.last_words)
  Comment.create(commenter_id:  user_a.id, post_id: p3.id, content:Faker::FamousLastWords.last_words)
  # 20.times do
  #   Comment.create(commenter_id: User.all.sample.id, post_id: Post.all.sample.id, content:Faker::FamousLastWords.last_words)
  # end
puts "done making comments"

puts "making votes"
  Vote.create(voter_id: user_a.id, post_id: p1.id, upvote:true)
  Vote.create(voter_id: user_a.id, post_id: p1.id, upvote:true)
  Vote.create(voter_id: user_b.id, post_id: p1.id, upvote:false)
puts "done making votes"
