class Feedback < ActiveRecord::Base
  # Feedback name, content and rating must be presented
  validates_presence_of :name, :content, :rating

  # Rating value must be in 1-5
  validates_inclusion_of :rating, :in => 1..5
  
  def self.average_rating
    # Feedback.average_rating is the interface to acess average rating function
    # It's is simple at first that you may want to use the code Feeback.average(:rating) directly
    # but it's wiser if wrap the code in a method so that you can add more code when needed without
    # changing the interface to call the function.
    # For example: You may eliminate too short feedback from average rating with assumption that 
    # feedback with content.length < 5 is not a good feed back.

    average(:rating) || 0 # if there is no feedback, return 0 instead of nil
  end
end
