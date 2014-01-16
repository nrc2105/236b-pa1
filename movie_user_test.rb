require_relative 'rating'
require_relative 'movie'
require_relative 'user'

rating1 = Rating.new(1,1,10,25)
rating2 = Rating.new(1,2,3,28)
rating3 = Rating.new(2,1,8,24)
rating4 = Rating.new(2,2,4,29)

user1 = User.new(rating1)
user1.add(rating2)
user2 = User.new(rating3)
user2.add(rating3)

movie1 = Movie.new(rating1)
movie1.add(rating3)
movie2 = Movie.new(rating2)
movie2.add(rating4)

puts user1
puts user2
puts movie1
puts movie2
