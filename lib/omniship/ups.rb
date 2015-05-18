require 'omniship/ups/track'

module OmniShip
  module UPS
    LABEL = "UPS"
    MI_LABEL = "UPS MI"
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :token
      attr_accessor :test
    end

    def self.track(id, mail_innovations=false)
      TrackRequest.track(id, mail_innovations)
    end
  end
end
