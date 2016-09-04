require 'optparse'

class Parser

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
      password = call_generator
      puts "Your password will be generated from a list of #{password.count} unique words."
    rescue Errno::ENOENT
      puts "That file doesn't exist. Try again."
    else
      password = password.generate!
      puts "Your password is: #{password}"
      if @options[:copy]
        pbcopy(password)
      end
    end    
  end

  private

  def self.pbcopy(input)
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    puts 'Copied to clipboard!'
  end

  def self.call_generator
    if @options[:average].nil
      Generator.new(ARGV[0], @options[:words])
    else 
      Generator.new(ARGV[0], @options[:words], @options[:average])
    end
  end  
end