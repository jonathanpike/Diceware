require 'spec_helper'

RSpec.describe Generator do
  before(:context) do
    file = Normalizer.new(File.expand_path('../../pride_and_prejudice.txt', __FILE__))
    @generator = Generator.new(file.normalize!, {word_count: 6})
  end

  describe "#generate!" do
    before(:example) do 
      @actual = @generator.generate!
    end 

    it "should return a string" do 
      expect(@actual).to be_kind_of(String)
    end

    it "should return a 6 word long string" do 
      expect(@actual.split(" ").count).to eq(6)
    end

    it "should return a different password each time" do 
      first = @generator.generate!
      second = @generator.generate!

      expect(first).not_to eq(second)
    end
  end

  describe "#count" do 
    it "should return a number" do 
      actual = @generator.count
      expect(actual).to be_kind_of(Integer)
    end

    it "should return 6059" do 
      actual = @generator.count
      expect(actual).to eq(6059)
    end 
  end 
end 