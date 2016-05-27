require 'omniship/ups/track'

module OmniShip
  module UPSMI
    LABEL = "UPS MI"

    def self.track(id)
      UPS::TrackRequest.track(id, true)
    end
  end
end
