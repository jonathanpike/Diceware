#!/usr/bin/env ruby

module Diceware 

  class Generator
    def initialize(file, number)
      @file = file.strip
      @number = number
      @words = IO.read(@file)
    end

    def generate_random_index
      prng = Random.new
      prng.rand(@array.count)
    end

    def sanitize_words
      @words.downcase!.gsub!(/\n/," ").gsub!(/[^a-z]/, ' ')
      self  
    end

    def to_array
      @array = @words.split(' ').reject! { |w| w.length < 4 }.uniq!
      puts "Your password will be generated from a list of #{@array.count} unique words."
      self 
    end

    def select!
      password = []
      @number.times do |num| 
        index = generate_random_index
        password << @array[index]
      end 
      password.join(" ")
    end
  end


  def self.file_name
    print "Enter a file name (txt format): "
    @file = gets.chomp
    
    if @number
      generate
    else 
      number
    end 
  end

  def self.number
    print "Enter the number of words your password should contain: "
    @number = gets.chomp

    if check_for_number(@number)
      generate
    else 
      puts "That's not a number.  Try again."
      number
    end 
  end 

  def self.check_for_number(number)
    return true if number.to_i.to_s == number
    false
  end

  def self.generate
    begin 
      password = Generator.new(@file, @number.to_i)
    rescue Errno::ENOENT => ex
      puts "That file doesn't exist. Try again."
      file_name
    else
      password = password.sanitize_words.to_array.select!
      puts "Your password is: #{password}"
      print "Do you want to copy your password to the clipboard? (Y|n) "
      input = gets.chomp
      if input == "Y"
        pbcopy(password)
      end
      print "Thanks for using the Custom Diceware Password Generator"
    end    
  end

  def self.pbcopy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    puts 'Copied to clipboard!'
  end

  begin 
    puts "Welcome to the Custom Diceware Password Generator"
    file_name
  rescue Interrupt => e
    puts 
    print "Thanks for using the Custom Diceware Password Generator"
  end 
end 