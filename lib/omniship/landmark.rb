require 'omniship/landmark/track'

module OmniShip
  module Landmark
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
