require 'omniship/dhlgm/track'


module OmniShip
  module DHLGM
    class << self
      attr_accessor :username
      attr_accessor :password
    end

    def self.track(id)
      TrackRequest.track(id)
    end
  end
end
