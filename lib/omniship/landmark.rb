require 'omniship/landmark/track'

# https://mercury.landmarkglobal.com/clients/KnowledgeBase/index.php?topic_name=API+Specifications&hash=bf8229696f7a3bb4700cfddef19fa23f#track
module Omniship
  module Landmark
    LABEL = "Landmark"
    TRACKING_REGEX = /\b(LTN\d+N\d+)\b/i
    TRACKING_URL = "https://mercury.landmarkglobal.com/tracking/track.php?trck="

    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :client_id
      attr_accessor :test_mode
    end

    def self.tracking_test?(tracking)
      tracking =~ TRACKING_REGEX
    end

    def self.track(id)
      Track::Request.track(id)
    end

    def self.track_with_reference(reference)
      Track::Request.track_with_reference(reference)
    end

    def self.tracking_url(number)
      TRACKING_URL + number
    end
  end
end
