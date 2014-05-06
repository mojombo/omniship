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
require 'omniship/usps'
require 'omniship/dhlgm'


module OmniShip
  VERSION = '0.0.1'

  class << self
    attr_accessor :debug
  end

  # Load configuration information from a YAML file.
  #
  # file - The String filename of the YAML config file.
  #
  # Returns nothing.
  def self.config(file)
    data = YAML::load(File.open(file))

    if omniship = data['OmniShip']
      OmniShip.debug = omniship['debug']

      if usps = omniship['USPS']
        USPS.userid = usps['userid']
        USPS.password = usps['password']
        USPS.client_ip = usps['client_ip']
        USPS.source_id = usps['source_id']

        if retailer = usps['retailer']
          USPS.retailer_name = retailer['name']
          USPS.retailer_address = retailer['address']
        end
        if permit = usps['permit']
          USPS.permit_number = permit['number']
          USPS.permit_city = permit['city']
          USPS.permit_state = permit['state']
          USPS.permit_zip5 = permit['zip5']
        end
        if pdu = usps['pdu']
          USPS.pdu_po_box = pdu['po_box']
          USPS.pdu_city = pdu['city']
          USPS.pdu_state = pdu['state']
          USPS.pdu_zip5 = pdu['zip5']
        end
      end

      if ups = omniship['UPS']
        UPS.username = ups['username']
        UPS.password = ups['password']
        UPS.token = ups['token']
      end

      if landmark = omniship['Landmark']
        Landmark.username = landmark['username']
        Landmark.password = landmark['password']
        Landmark.client_id = landmark['client_id']
        Landmark.test_mode = landmark['test_mode']
      end

      if dhlgm = omniship['DHLGM']
        DHLGM.username = dhlgm['username']
        DHLGM.password = dhlgm['password']
      end
    end

    if OmniShip.debug
      Handsoap::Service.logger = STDOUT
    end
    nil
  end

  # Track a package based on a tracking number
  # supports Landmark Global, UPS, DHL Global Mail, USPS
  def self.track(number)
    case self.shipper_label(number)
    when "UPS"
      OmniShip::UPS.track(number)
    when "Landmark"
      OmniShip::Landmark.track(number)
    when "DHL Global Mail"
      OmniShip::DHLGM.track(number)
    when "USPS"
      OmniShip::USPS.track(number)
    else 
      nil
    end
  end

  # Generate a tracking URL based on a tracking number
  # supports UPS, USPS, DHL, DHL Global Mail, FedEx, Landmark Global
  def self.tracking_url(number)
    case self.shipper_label(number)
    when "UPS"
      "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=#{number}"
    when "Landmark"
      "https://mercury.landmarkglobal.com/tracking/track.php?trck=#{number}"
    when "FedEx"
      "http://www.fedex.com/Tracking?action=track&tracknumbers=#{number}"
    when "DHL Global Mail"
      "http://webtrack.dhlglobalmail.com/?trackingnumber=#{number}"
    when "DHL"
      "http://www.dhl.com/content/g0/en/express/tracking.shtml?brand=DHL&AWB=#{number}"
    when "USPS"
      "https://tools.usps.com/go/TrackConfirmAction_input?qtc_tLabels1=#{number}"
    else 
      nil
    end
  end

  def self.shipper_label(number)
    ups = /\b(1Z ?[0-9A-Z]{3} ?[0-9A-Z]{3} ?[0-9A-Z]{2} ?[0-9A-Z]{4} ?[0-9A-Z]{3} ?[0-9A-Z]|[\dT]\d\d\d ?\d\d\d\d ?\d\d\d)\b/i
    usps = /\b(91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d|91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d)\b/i
    usps2 = /^E\D{1}\d{9}\D{2}$|^9\d{15,21}$/
    usps3 = /^91[0-9]+$/
    usps4 = /^[A-Za-z]{2}[0-9]+US$/
    fedex = /\b((96\d\d\d\d\d ?\d\d\d\d|96\d\d) ?\d\d\d\d ?d\d\d\d( ?\d\d\d)?)\b/i
    landmark = /\b(LTN\d+N\d+)\b/i
    dhl = /^\d{10,11}$/
    dhlgm = /^\d{22}$/

    if !(number =~ ups).nil?
      "UPS"
    elsif !(number =~ landmark).nil?
      "Landmark"
    elsif !(number =~ fedex).nil?
      "FedEx"
    elsif !(number =~ dhlgm).nil?
      "DHL Global Mail"
    elsif !(number =~ dhl).nil?
      "DHL"
    elsif !(number =~ usps).nil? or !(number =~ usps2).nil? or !(number =~ usps3).nil? or !(number =~ usps4).nil?
      "USPS"
    else 
      nil
    end
  end
end