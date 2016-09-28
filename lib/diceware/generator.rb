class Generator
  attr_reader :words, :word_count, :average
  
  def initialize(words, options)
    @words = words
    @word_count = options.fetch(:word_count, 6)
    @average = options.fetch(:average, 6)
  end

  def count 
    words.count
  end

  def generate!
    password = []
    word_count.times do |num| 
      index = random_index_average
      password << words[index]
    end 
    password.join(" ")
  end

  private 

  def generate_random_index
    prng = Random.new
    prng.rand(words.count)  
  end

  def random_index_average
    indices = []
    average.times { indices << generate_random_index }
    indices.inject(&:+) / average
  end
end