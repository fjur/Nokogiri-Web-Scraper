# Helper file to setup our tests/specs for this program.
# NO NEED TO EDIT

require 'pry'
require 'rspec'
# require 'rubygems'
# require 'nokogiri'
# require 'open-uri'


def safely_require(file)
  require_relative file
rescue LoadError
  # ignore
end


safely_require '../post'
safely_require '../comment'

