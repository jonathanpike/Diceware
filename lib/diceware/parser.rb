require 'optparse'

class Parser

  VERSION = '0.2.0'

  attr_reader :options

  def self.parse(args)
    @options = {}
    option_parser.parse!(args)
    generate
  end 

  private

  def self.option_parser 
    OptionParser.new do |opts| 
      opts.banner = "Usage: diceware.rb [options...] <file name>"
      opts.separator ""
      opts.separator "Options"
      opts.on('-w', '--words [NUM]', 
              'number of words the password will contain (default 6)') do |words|
        @options[:words] = words.to_i
      end
      opts.on('-a', '--average [NUM]', 
              'randomize password generation further (default 6)') do |average|
        @options[:average] = average.to_i
      end
      opts.on('-v', '--verbose', "show verbose output") do 
        @options[:verbose] = true
      end 
      opts.on('--copy', 'copies result to clipboard') do |copy|
        @options[:copy] = true
      end 
      opts.separator ""
      opts.on_tail('--version', 'show version number') do
        puts "Diceware.rb version #{VERSION}"
        exit
      end
      opts.on_tail('-h', "--help", "show this help") do 
        puts opts 
        exit
      end 
    end 
  end

  def self.generate
    password = setup_generator
    password = password.generate!
    puts "Your password is: #{password}"
    pbcopy(password)
  end  

  def self.pbcopy(input)
    return unless @options[:copy]
    str = input.to_s
    IO.popen('pbcopy', 'w') { |f| f << str }
    puts 'Copied to clipboard!'
  end

  def self.verbose
    return unless @options[:verbose]
    puts "Your password will be generated from a list of #{password.count} unique words."
  end 

  def self.setup_generator
    begin
      Generator.new(ARGV[0], @options[:words], @options[:average])
    rescue Errno::ENOENT
      puts "That file doesn't exist. Try again."
    end 
  end  
end