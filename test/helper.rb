require 'rubygems'
require 'shoulda'

require File.join(File.dirname(__FILE__), *%w[.. lib omniship])

config_file = File.join(File.dirname(__FILE__), *%w[config.yml])

unless File.exist?(config_file)
  puts "You need a valid 'config.yml' to run the test."
  exit 1
end

OmniShip.config(config_file)