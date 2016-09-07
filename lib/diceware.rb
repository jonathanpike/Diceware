#!/usr/bin/env ruby

require_relative 'diceware/generator'
require_relative 'diceware/parser'

begin
  ARGV << "--help" if ARGV.empty?
  Parser.parse(ARGV)
rescue Interrupt
  puts
end 