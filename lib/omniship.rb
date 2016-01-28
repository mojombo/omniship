$:.unshift File.dirname(__FILE__)

# stdlib
require 'yaml'
require 'cgi'
require 'securerandom'

# 3rd Party
require 'json'

# Internal
require 'omniship/version'
require 'omniship/ups'
require 'omniship/landmark'
require 'omniship/usps'
require 'omniship/dhlgm'
require 'omniship/dhl'
require 'omniship/fed_ex'


module OmniShip

  class << self
    attr_accessor :debug
  end

  # Load configuration information from a YAML file.
  #
  # file - The String filename of the YAML config file.
  #
  # Returns nothing.
  def self.config(file)
    data = YAML.load(ERB.new(File.read(file)).result)

    if omniship = data['OmniShip']
      OmniShip.debug = omniship['debug']

      if usps = omniship['USPS']
        USPS.userid = usps['userid']
        USPS.password = usps['password']
        USPS.client_ip = usps['client_ip']
        USPS.source_id = usps['source_id']
        USPS.test = usps['test']

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
        UPS.test = ups['test']
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
        DHLGM.mailer_id = dhlgm['mailer_id'].to_s # this could be implied an integer by the yaml parser
      end
    end
    nil
  end

  # Track a package based on a tracking number
  # supports Landmark Global, UPS, DHL Global Mail, USPS
  def self.track(number)
    case self.shipper_label(number)
    when "UPS MI"
      OmniShip::UPS.track(number, true)
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
    when UPS::MI_LABEL
      "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=#{number}"
    when UPS::LABEL
      "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=#{number}"
    when Landmark::LABEL
      "https://mercury.landmarkglobal.com/tracking/track.php?trck=#{number}"
    when FedEx::LABEL
      "http://www.fedex.com/Tracking?action=track&tracknumbers=#{number}"
    when DHLGM::LABEL
      "http://webtrack.dhlglobalmail.com/?trackingnumber=#{number}"
    when DHL::LABEL
      "http://www.dhl.com/content/g0/en/express/tracking.shtml?brand=DHL&AWB=#{number}"
    when USPS::LABEL
      "https://tools.usps.com/go/TrackConfirmAction_input?qtc_tLabels1=#{number}"
    else 
      nil
    end
  end

  def self.shipper_label(number)
    ups = /\b(1Z ?[0-9A-Z]{3} ?[0-9A-Z]{3} ?[0-9A-Z]{2} ?[0-9A-Z]{4} ?[0-9A-Z]{3} ?[0-9A-Z]|[\dT]\d\d\d ?\d\d\d\d ?\d\d\d)\b/i
    ups_mi = /^\d{18}$/
    ups_mi2 = /MI.*/
    usps = /\b(91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d|91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d)\b/i
    usps2 = /^E\D{1}\d{9}\D{2}$|^9\d{15,21}$/
    usps3 = /^91[0-9]+$/
    usps4 = /^[A-Za-z]{2}[0-9]+US$/
    fedex = /\b((96\d\d\d\d\d ?\d\d\d\d|96\d\d) ?\d\d\d\d ?d\d\d\d( ?\d\d\d)?)\b/i
    landmark = /\b(LTN\d+N\d+)\b/i
    dhl = /^\d{10,11}$/
    dhlgm = /^\d{22}$/

    if !(number =~ ups_mi).nil? or !(number =~ ups_mi2).nil?
      UPS::MI_LABEL
    elsif !(number =~ ups).nil?
      UPS::LABEL
    elsif !(number =~ landmark).nil?
      Landmark::LABEL
    elsif !(number =~ fedex).nil?
      FedEx::LABEL
    elsif number.length == 22 and number.include?(OmniShip::DHLGM.mailer_id) 
      # have to use the mailer_id here because otherwise its indistinguisable from a USPS number. that sucks but its all we got.
      DHLGM::LABEL
    elsif !(number =~ dhl).nil?
      DHL::LABEL
    elsif !(number =~ usps).nil? or !(number =~ usps2).nil? or !(number =~ usps3).nil? or !(number =~ usps4).nil?
      USPS::LABEL
    else 
      nil
    end
  end
end