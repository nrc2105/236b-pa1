require_relative 'movie_data'

database = MovieData.new
database.read_in_movie_data(ARGV[0])
list = database.popularity_list
list.each do |movie|
puts movie
end
