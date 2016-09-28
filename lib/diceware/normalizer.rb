class Normalizer
  attr_reader :file

  def initialize(file)
    @file = IO.read(file)
  end

  def normalize!
    file.downcase!.gsub!(/\n/," ").gsub!(/[^a-z]/, ' ')
        .split(' ').reject! { |w| w.length < 4 }.uniq!
  end 
end 