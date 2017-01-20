module Omniship
  module Landmark
    module Track
      class Package
        ARRIVAL_CODES = ["500"]
        DEPARTURE_CODES = ["75"]

        def initialize(root)
          @root = root
        end

        def tracking_number
          @root.xpath("LandmarkTrackingNumber/text()").to_s
        end

        def activity
          @root.xpath('Events/Event').map do |act|
            Activity.new(act)
          end
        end

        # this is actually an indicator that the landmark shipping facility has received the package
        def has_left?
          activity.any? do |activity|
            DEPARTURE_CODES.include? activity.code
          end
        end

        def has_arrived?
          activity.any? do |activity|
            ARRIVAL_CODES.include? activity.code
          end
        end

        def scheduled_delivery
          Omniship::Landmark.parse_timestamp(@root.xpath('ExpectedDelivery/text()').to_s)
        end
      end
    end
  end
end
