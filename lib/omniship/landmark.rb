require 'omniship/landmark/track'

# https://mercury.landmarkglobal.com/clients/KnowledgeBase/index.php?topic_name=API+Specifications&hash=bf8229696f7a3bb4700cfddef19fa23f#track
module OmniShip
  module Landmark
    LABEL = "Landmark"
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :client_id
      attr_accessor :test_mode
    end

    def self.track(id)
      TrackRequest.track(id)
    end


    def self.track_with_reference(reference)
      TrackRequest.track_with_reference(reference)
    end
  end
end
