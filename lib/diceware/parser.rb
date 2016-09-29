module Diceware 
  class Parser
    attr_accessor :options

    def initialize(args)
      @options = {}
      option_parser.parse!(args)
      generate
    end 

    private

    def option_parser 
      OptionParser.new do |opts| 
        opts.banner = "Usage: diceware.rb [options...] <file name>"
        opts.separator ""
        opts.separator "Options"
        opts.on('-w', '--words [NUM]', 
                'number of words the password will contain (default 6)') do |words|
          options[:word_count] = words.to_i
        end
        opts.on('-a', '--average [NUM]', 
                'randomize password generation further (default 6)') do |average|
          options[:average] = average.to_i
        end
        opts.on('-v', '--verbose', "show verbose output") do 
          options[:verbose] = true
        end 
        opts.on('--copy', 'copies result to clipboard') do |copy|
          options[:copy] = true
        end 
        opts.separator ""
        opts.on_tail('--version', 'show version number') do
          puts Diceware.version
          exit
        end
        opts.on_tail('-h', "--help", "show this help") do 
          puts opts 
          exit
        end 
      end 
    end

    def generate
      password = normalize_and_generate
      verbose(password)
      password = password.generate!
      puts "Your password is: #{password}"
      pbcopy(password)
    end  

    def pbcopy(input)
      return unless options[:copy]
      str = input.to_s
      IO.popen('pbcopy', 'w') { |f| f << str }
      puts 'Copied to clipboard!'
    end

    def verbose(password)
      return unless options[:verbose]
      puts "Your password will be generated from a list of #{password.count} unique words."
    end 

    def normalize_and_generate
      begin
        file = Normalizer.new(ARGV[0]).normalize!
        Generator.new(file, options)
      rescue Errno::ENOENT
        puts "That file doesn't exist. Try again."
      end 
    end  
  end
end 