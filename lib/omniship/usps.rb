require 'omniship/usps/return_label'
require 'omniship/usps/track'

module Omniship
  module USPS
    LABEL = "USPS"
    TRACKING_REGEX = [/\b(91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d|91\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d ?\d\d\d\d)\b/i, 
                      /^E\D{1}\d{9}\D{2}$|^9\d{15,21}$/, 
                      /^(91|92)[0-9]+$/, 
                      /^[A-Za-z]{2}[0-9]+US$/]
    TRACKING_URL = "https://tools.usps.com/go/TrackConfirmAction?qtc_tLabels1="
    
    class << self
      attr_accessor :userid
      attr_accessor :password
      attr_accessor :retailer_name
      attr_accessor :retailer_address
      attr_accessor :permit_number
      attr_accessor :permit_city
      attr_accessor :permit_state
      attr_accessor :permit_zip5
      attr_accessor :pdu_po_box
      attr_accessor :pdu_city
      attr_accessor :pdu_state
      attr_accessor :pdu_zip5
      attr_accessor :client_ip
      attr_accessor :source_id
      attr_accessor :test
    end

    def self.return_label(customer, options = nil)
      retailer = {
        name: retailer_name,
        address: retailer_address
      }
      permit = {
        number: permit_number,
        city: permit_city,
        state: permit_state,
        zip5: permit_zip5
      }
      pdu = {
        po_box: pdu_po_box, 
        city: pdu_city,
        state: pdu_state,
        zip5: pdu_zip5
      }
      request = ReturnLabelRequest.new(ReturnLabel::Customer.new(customer), ReturnLabel::Retailer.new(retailer), ReturnLabel::Permit.new(permit), ReturnLabel::PDU.new(pdu), options)
      request.get_response
    end

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any?{|regex| tracking =~ regex}
    end
    
    def self.track(id)
      Track::Request.track(id)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end
