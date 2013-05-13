$:.unshift File.dirname(__FILE__)

# stdlib
require 'yaml'
require 'cgi'

# 3rd Party
require 'handsoap'
require 'json'

# Internal
require 'omniship/ups'
require 'omniship/landmark'

#debug Handsoap::Service.logger = STDOUT

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

    if landmark = data['Landmark']
      Landmark.username = landmark['username']
      Landmark.password = landmark['password']
      Landmark.client_id = landmark['client_id']
    end
  end

  def self.track(number)
    ups = /\b(1Z ?[0-9A-Z]{3} ?[0-9A-Z]{3} ?[0-9A-Z]{2} ?[0-9A-Z]{4} ?[0-9A-Z]{3} ?[0-9A-Z]|[\dT]\d\d\d ?\d\d\d\d ?\d\d\d)\b/i
    landmark = /\b(LTN\d+N\d+)\b/i

   
    if !(number =~ ups).nil?
      OmniShip::UPS.track(number)
    elsif !(number =~ landmark).nil?
      OmniShip::Landmark.track(number)
    else 
      nil
    end
  end

  def self.tracking_url(number)
    ups = /\b(1Z ?[0-9A-Z]{3} ?[0-9A-Z]{3} ?[0-9A-Z]{2} ?[0-9A-Z]{4} ?[0-9A-Z]{3} ?[0-9A-Z]|[\dT]\d\d\d ?\d\d\d\d ?\d\d\d)\b/i
    usps = /\b(91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d|91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d)\b/i
    fedex = /\b((96\d\d\d\d\d ?\d\d\d\d|96\d\d) ?\d\d\d\d ?d\d\d\d( ?\d\d\d)?)\b/i
    landmark = /\b(LTN\d+N\d+)\b/i

    if !(number =~ ups).nil?
      "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=#{number}"
    elsif !(number =~ landmark).nil?
      "https://mercury.landmarkglobal.com/tracking/track.php?trck=#{number}"
    elsif !(number =~ usps).nil?
      "https://tools.usps.com/go/TrackConfirmAction_input?qtc_tLabels1=#{number}"
    elsif !(number =~ fedex).nil?
      "http://www.fedex.com/Tracking?action=track&tracknumbers=#{number}"
    else 
      nil
    end
  end
end