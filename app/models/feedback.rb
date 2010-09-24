class Feedback < ActiveRecord::Base
  # Feedback name, content and rating must be presented
  validates_presence_of :name, :content, :rating

  # Define a contant for reuse purpose
  RATING_VALUES = 1..5

  # Rating value must be in 1-5
  validates_inclusion_of :rating, 
    :in => RATING_VALUES, 
    :message => 'Rating must be in 1-5', 
    :allow_blank => true
    # allow_blank in rating value validation so that if rating is blank (user did not choose a value)
    # the system only show the first message "Rating can't be blank". 
    # If rating value is not blank, then it must be in 1..5
  
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
