#The MovieData class reads in the file, and stores it as a list
#of users and movies

require 'csv'
require_relative 'rating'
require_relative 'movie'
require_relative 'user'

class MovieData

  attr_reader :user_list
  
  #Initializes empty hashes of movies and users
  def initialize
    @movie_list = {}
    @user_list = {}
    @count = 0
  end

  #Reads in a file separated by tabs and creates a new rating, then calls the appropriate add methods
  def read_in_movie_data(file_name)
    CSV.foreach(file_name, headers: "user_id\tmovie_id\trating\ttimestamp", col_sep:"\t") do |row|
      temp_rating = Rating.new(row["user_id"],row["movie_id"],row["rating"],row["timestamp"])
      add_movie(temp_rating)
      add_user(temp_rating)
      @count = @count + 1
    end
  end

  #Checks to see if the movie already resides on the list, otherwise adds it
  def add_movie(rating)
    if movie_temp = @movie_list[rating.movie_id]
      movie_temp.add(rating)
    else
      @movie_list[rating.movie_id] =  Movie.new(rating)
    end
  end

  #Checks to see if the user already resides on the list, otherwise adds it
  def add_user(rating)
    if user_temp = @user_list[rating.user_id]
      user_temp.add(rating)
    else
      @user_list[rating.user_id] = User.new(rating)
    end
  end

  def popularity(id_number)
    if temp_movie = @movie_list[id_number]
      return temp_movie.popularity
    else
      return "Movie not in data set"
    end
  end

  def popularity_list
    #Create and print out a list of movies in order of popularity
    sorted_movies = @movie_list.values.sort{|a,b| b.popularity <=> a.popularity}
    #return sorted_movies.reverse!
    return sorted_movies
  end

  def similarity(user1, user2)
    return @user_list[user1].similarity(@user_list[user2])
  end

  def most_similar(u)
    #returns a list of similar users
    @user_list.values.sort{|a,b| @user_list[u].similarity(b) <=> @user_list[u].similarity(a)}
    #top_ten = []
   # for i in 1..10
    #  top_ten << "#{i}. #{similar_users[i]}"
   # end
   # return top_ten
  end



  #DEBUG
  def to_s
    "This list contains #{@count} ratings, #{@user_list.size} users, and #{@movie_list.size} movies, #{@movie_list["1641"]}"
  end
end
