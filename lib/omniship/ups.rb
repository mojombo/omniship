require 'omniship/ups/track'

module Omniship
  module UPS
    LABEL = "UPS"
    TRACKING_REGEX = [/\b(1Z ?[0-9A-Z]{3} ?[0-9A-Z]{3} ?[0-9A-Z]{2} ?[0-9A-Z]{4} ?[0-9A-Z]{3} ?[0-9A-Z]|[\dT]\d\d\d ?\d\d\d\d ?\d\d\d)\b/i]
    TRACKING_URL = "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums="

    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :token
      attr_accessor :test
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
