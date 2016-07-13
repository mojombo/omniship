require 'omniship/newgistics/track'

module Omniship
  module Newgistics
    LABEL = "Newgistics"

    # this regex works for the barcode only
    TRACKING_REGEX = /7(21|25)(00|01|10|20)\d{5}\d{2}\d{4}\d{2}\d{7,29}\d/i
    TRACKING_URL = "http://tracking.smartlabel.com/Default.aspx?TrackingValue="
    BARCODE = 'Barcode'
    REFERENCE_NUMBER = 'Reference Number'

    class << self
      attr_accessor :merchant_id
      attr_accessor :api_key
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      !!(tracking =~ TRACKING_REGEX)
    end

    def self.track(id, qualifier=BARCODE)
      Track::Request.track(id, qualifier)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end