require 'omniship/dhlgm/track'

module Omniship
  module DHLGM
    LABEL = "DHL Global Mail"
    TRACKING_LENGTH = 22
    TRACKING_URL = "http://webtrack.dhlglobalmail.com/?trackingnumber="

    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :mailer_id
    end


    def self.tracking_test?(tracking)
      !Omniship::DHLGM.mailer_id.nil? and tracking.length == TRACKING_LENGTH and tracking.include?(Omniship::DHLGM.mailer_id) 
    end

    def self.track(id)
      Track::Request.track(id)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end
