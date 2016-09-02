#!/usr/bin/env ruby

require_relative 'diceware/generator'
require 'optparse'

class Diceware

  VERSION = '0.2.0'

  def self.parse(args)
    @options = {}
    option_parser.parse!(args)
  end 

  def self.option_parser 
    OptionParser.new do |opts| 
      opts.banner = "Usage: diceware [options...] <file name>"
      opts.separator ""
      opts.separator "Options"
      opts.on('-w', '--words NUM', 
              'Specify number of words password should contain') do |words|
        @options[:words] = words.to_i
      end
      opts.on('-a', '--average NUM', 
              'Specify how random the password should be') do |average|
        @options[:average] = average.to_i
      end
      opts.on('--[no-]copy', 'Copies result to clipboard') do |copy|
        @options[:copy] = copy
      end 
      opts.separator ""
      opts.on_tail('--version', 'Show version number') do
        puts "Diceware.rb version #{VERSION}"
        exit
      end
      opts.on_tail('-h', "--help", "Show this help") do 
        puts opts 
        exit
      end 
    end 
  end

  def self.generate
    begin 
      password = Generator.new(ARGV[0], @options[:words], @options[:average])
      puts "Your password will be generated from a list of #{password.array.count} unique words."
    rescue Errno::ENOENT
      puts "That file doesn't exist. Try again."
      file_name
    else
      gets
      password = password.generate!
      puts "Your password is: #{password}"
      if @options[:copy]
        pbcopy(password)
      end
    end    
  end

  def self.pbcopy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    puts 'Copied to clipboard!'
  end
end

begin
  ARGV << "--help" if ARGV.empty?
  Diceware.parse(ARGV)
  Diceware.generate
rescue Interrupt
  puts
end 