#Movie class stores all user ratings and calculates popularity
require_relative 'rating'

class Movie
  
  attr_reader :popularity
  #initializes the Movie with its first rating
  def initialize(rating)
   # @rating_list = [rating]
    @id = rating.movie_id
    @popularity = rating.rating.to_i - 3
  end

  def add(rating)
   # @rating_list << rating
    @popularity += rating.rating.to_i - 3
  end
  
  def to_s
    "Movie #{@id}"
  end
end
