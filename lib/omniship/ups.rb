require 'omniship/ups/track'

module OmniShip
  module UPS
    LABEL = "UPS"
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :token
      attr_accessor :test
    end

    def self.track(id)
      TrackRequest.track(id)
    end
  end
end
