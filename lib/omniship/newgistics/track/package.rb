module Omniship
  module Newgistics
    module Track
      class Package
        ARRIVAL_STATUSES = ["Delivered"]
        DEPARTURE_STATUSES = ["Received", "InTransit", "Departed", "InUSPSNetwork"] + ARRIVAL_STATUSES

        def initialize(root)
          @root = root
        end

        def tracking_number
          @root["TrackingNumber"]
        end

        def activity
          if @root["PackageTrackingEvents"]
            @root["PackageTrackingEvents"].map do |act|
              Activity.new(act)
            end
          else
            []
          end
        end

        def has_left?
          DEPARTURE_STATUSES.include?(@root["Status"])
        end

        def has_arrived?
          ARRIVAL_STATUSES.include?(@root["Status"])
        end

        def scheduled_delivery
          Omniship::Newgistics.parse_timestamp(@root["EstimatedDeliveryDate"])
        end
      end
    end
  end
end
