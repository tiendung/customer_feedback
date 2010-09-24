require 'spec_helper'

describe Feedback do
  describe 'Feedback.avg_rating' do
    before :each do
      # Remove all feedback
      Feedback.delete_all
    end
    
    it 'should return 0 if there is no feedback' do
      Feedback.count.should == 0
      Feedback.average_rating.should == 0
    end
    
    it 'should work correctly' do
      Feedback.average_rating.should == 0

      Factory(:feedback, :rating => 1)
      Feedback.average_rating.should == 1
      
      Factory(:feedback, :rating => 3)
      Feedback.average_rating.should == 2

      Factory(:feedback, :rating => 4)
      Feedback.average_rating.should == 8/3.0
    end
  end
end