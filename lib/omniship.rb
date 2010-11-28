$:.unshift File.dirname(__FILE__)

# stdlib
require 'yaml'
require 'cgi'

# 3rd Party
require 'handsoap'
require 'json'

# Internal
require 'omniship/ups'

Handsoap::Service.logger = STDOUT

module OmniShip
  VERSION = '0.0.1'

  # Load configuration information from a YAML file.
  #
  # file - The String filename of the YAML config file.
  #
  # Returns nothing.
  def self.config(file)
    data = YAML::load(File.open(file))
    if ups = data['UPS']
      UPS.username = ups['username']
      UPS.password = ups['password']
      UPS.token = ups['token']
    end
  end
end