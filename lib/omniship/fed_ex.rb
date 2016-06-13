require 'omniship/dhlgm/track'

module Omniship
  module FedEx
    LABEL = "FedEx"
    TRACKING_REGEX = [/(\b96\d{20}\b)|(\b\d{15}\b)|(\b\d{12}\b)/,
                      /\b((98\d\d\d\d\d?\d\d\d\d|98\d\d) ?\d\d\d\d ?\d\d\d\d( ?\d\d\d)?)\b/,
                      /^[0-9]{15}$/]
    TRACKING_URL = "http://www.fedex.com/Tracking?action=track&tracknumbers="

    def self.tracking_test?(tracking)
      TRACKING_REGEX.any?{|regex| tracking =~ regex}
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end