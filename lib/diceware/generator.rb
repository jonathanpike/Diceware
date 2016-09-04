class Generator
  def initialize(file, number, average=6)
    @file = file
    @number = number
    @average = average
    @words = IO.read(@file)
    @array = @words.downcase!.gsub!(/\n/," ").gsub!(/[^a-z]/, ' ')
             .split(' ').reject! { |w| w.length < 4 }.uniq!
  end

  def count 
    @array.count
  end

  def generate!
    password = []
    @number.times do |num| 
      index = random_index_average
      password << @array[index]
    end 
    password.join(" ")
  end

  private 

  def generate_random_index
    prng = Random.new
    prng.rand(@array.count)  
  end

  def random_index_average
    indices = []
    @average.times { indices << generate_random_index }
    indices.inject(&:+) / @average
  end
end