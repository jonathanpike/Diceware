require 'spec_helper'

RSpec.describe Diceware::Normalizer do
  describe "#normalize!" do
    before(:example) do
      @normalizer = Diceware::Normalizer.new(File.expand_path('../../pride_and_prejudice.txt', __FILE__))
      @actual = @normalizer.normalize!
    end 

    it "should return an array" do 
      expect(@actual).to be_kind_of(Array)
    end

    it "should have 6059 items" do 
      expect(@actual.count).to eq(6059)
    end
  end
end 