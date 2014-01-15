require_relative 'movie_data.rb'

database = MovieData.new

ARGV.each do |file_name|
  database.read_in_movie_data(file_name)
end

puts database

puts "The popularity of 242 is #{database.popularity("242")}"

puts"The similarity between users 1 and 242 is #{database.similarity("1","242")}"
popularityList = database.popularity_list

count = 1

popularityList.each do |movie|
  puts "#{count}. #{movie}"
  count += 1
end

puts "The popularity of 243 is #{database.popularity("243")}"
puts "The popularity of 678 should be higher and is #{database.popularity("678")}"

puts "50 should be the highest #{database.popularity("50")}"

similar_users = database.most_similar("79")
puts "Most similar to 79"

similar_users.each do |user|
  puts user
end

