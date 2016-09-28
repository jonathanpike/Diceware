class Generator
  attr_reader :word_count, :average, :array
  def initialize(file, word_count, average)
    @file = file
    @word_count = word_count || 6
    @average = average || 6
    @words = IO.read(@file)
    @array = @words.downcase!.gsub!(/\n/," ").gsub!(/[^a-z]/, ' ')
             .split(' ').reject! { |w| w.length < 4 }.uniq!
  end

  def count 
    array.count
  end

  def generate!
    password = []
    word_count.times do |num| 
      index = random_index_average
      password << array[index]
    end 
    password.join(" ")
  end

  private 

  def generate_random_index
    prng = Random.new
    prng.rand(array.count)  
  end

  def random_index_average
    indices = []
    average.times { indices << generate_random_index }
    indices.inject(&:+) / average
  end
end