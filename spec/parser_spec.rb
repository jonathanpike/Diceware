require 'spec_helper'

RSpec.describe Parser do
  it "should respond to parse_and_generate" do 
    expect(Parser).to respond_to(:parse)
  end 
end 