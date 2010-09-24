require 'spec_helper'

describe Feedback do
  describe 'Feedback.avg_rating' do
    it 'should return 0 if there is no feedback' do
      Feedback.delete_all
      Feedback.count.should == 0
      Feedback.average_rating.should == 0
    end
  end
end