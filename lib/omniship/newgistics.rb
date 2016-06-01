require 'omniship/newgistics/track'

module Omniship
  module Newgistics
    LABEL = "Newgistics"
    TRACKING_REGEX = /TODO/
    TRACKING_URL = "http://tracking.smartlabel.com/Default.aspx?TrackingValue="

    class << self
      attr_accessor :merchant_id
      attr_accessor :api_key
      attr_accessor :test
    end

    def self.tracking_test?(tracking)
      tracking =~ TRACKING_REGEX
    end

    def self.track(id)
      Track::Request.track(id)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end