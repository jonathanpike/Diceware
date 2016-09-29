#!/usr/bin/env ruby

diceware_path = File.expand_path("../../lib", __FILE__)
$:.unshift(diceware_path)

require 'diceware'

ARGV << "--help" if ARGV.empty?
Diceware::Parser.new(ARGV)
