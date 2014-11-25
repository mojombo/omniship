require 'omniship/dhlgm/track'


module OmniShip
  module DHLGM
    LABEL = "DHL Global Mail"
    class << self
      attr_accessor :username
      attr_accessor :password
      attr_accessor :mailer_id
    end

    def self.track(id)
      TrackRequest.track(id)
    end
  end
end
