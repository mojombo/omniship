require 'omniship/landmark/track'

module OmniShip
  module Landmark
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :client_id
    end

    def self.track(id)
      TrackRequest.track(id)
    end


    def self.track_with_reference(reference, client_id)
      TrackRequest.track_with_reference(reference, client_id)
    end
  end
end
