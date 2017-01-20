module Omniship
  module USPS
    module Track
      class Package

        def initialize(root)
          @root = root
        end

        def tracking_number
          @root.attribute("ID").to_s
        end

        def activity
          @root.xpath('TrackSummary').map do |act|
            Activity.new(act)
          end +
          @root.xpath('TrackDetail').map do |act|
            Activity.new(act)
          end
        end

        # this is actually an indicator that the the package has been scanned by USPS ANYWHERE
        # https://about.usps.com/publications/pub97/pub97_i.htm
        def has_left?
          has_arrived? or 
          activity.any? {|activity|
            [
              "SF", # UNDOCUMENTED but seems to be "Acceptance"
              "03", # Accept or Pickup (by carrier)
              "10", # Processed
              "80", # Picked Up by Shipping Partner
              "81", # Arrived Shipping Partner Facility
              "82", 
              "16", # Available for Returns Agent
              "MR" # UNDOCUMENTED Picked Up and Processed by Agent
            ].include?(activity.code) # Departed Shipping Partner Facility
          }
        end

        def has_arrived?
          # http://about.usps.com/publications/pub97/pub97_i.htm
          activity.any? {|activity|
            # deliverred or ready for pickup at post office, or Notice Left 
            ["01", # Delivered*
              "17", # Picked Up By Agent, Tendered to Returns Agent
              "MR" # UNDOCUMENTED Picked Up and Processed by Agent
            ].include?(activity.code)
          }
        end

        def scheduled_delivery
          Omniship::USPS.parse_timestamp(@root.xpath("PredictedDeliveryDate/text()").to_s)
        end
      end
    end
  end
end
