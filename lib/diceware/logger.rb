module Diceware
  class Logger
    attr_reader :password_array, :word_list_file
    
    DEFAULT_WORD_LIST = '../tmp/word_list.txt'

    def initialize(password_array, word_list_file=DEFAULT_WORD_LIST)
      @password_array = password_array
      @word_list_file = word_list_file
    end

    def log_list
      check_file_for_contents
    end

    private 

    def check_file_for_contents
      if File.size?(word_list_file).nil?
        write_file(password_array)
      else 
        contents = get_unique_words
        write_file(contents)
      end
    end

    def get_unique_words
      file = File.open(word_list_file, 'r')
      json = JSON.parse(file.read)
      (json + password_array).uniq!
    end 

    def write_file(contents)
      File.open(word_list_file, 'w+') do |file|
        file.puts contents.to_json
      end 
    end 
  end 
end