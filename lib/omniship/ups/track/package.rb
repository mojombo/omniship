module Omniship
  module UPS
    module Track
      class Package < Omniship::Base
        DEPARTURE_CODE = "I"
        ARRIVAL_CODE = "D"

        def tracking_number
          @root.xpath('TrackingNumber/text()').to_s
        end

        def activity
          @root.xpath('Activity').map do |act|
            Activity.new(act)
          end
        end

        def alternate_tracking
          path = @root.xpath('AlternateTrackingInfo')
          AlternateTracking.new(path) if path
        end

        def has_left?
          activity.any? {|activity| activity.code == DEPARTURE_CODE }
        end

        def has_arrived?
          activity.any? {|activity| activity.code == ARRIVAL_CODE }
        end
      end
    end
  end
end
