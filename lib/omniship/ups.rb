require 'omniship/ups/track'

module OmniShip
  module UPS
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :token
    end

    def self.track(id, mail_innovations=false)
      TrackRequest.track(id, mail_innovations)
    end
  end
end
