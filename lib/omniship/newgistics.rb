require 'omniship/newgistics/track'

module Omniship
  module Newgistics
    LABEL = "Newgistics"
    TRACKING_REGEX = /TODO/
    TRACKING_URL = "http://tracking.smartlabel.com/Default.aspx?TrackingValue="
    BARCODE = 'Barcode'
    REFERENCE_NUMBER = 'Reference Number'

    class << self
      attr_accessor :merchant_id
      attr_accessor :api_key
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      tracking =~ TRACKING_REGEX
    end

    def self.track(id, qualifier=BARCODE)
      Track::Request.track(id, qualifier)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end