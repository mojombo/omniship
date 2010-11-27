require 'omniship/ups/track'

module OmniShip
  module UPS
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :token
    end

    def self.track(id)
      TrackRequest.track(id)
    end
  end
end
