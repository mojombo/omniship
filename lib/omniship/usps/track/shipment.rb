module Omniship
  module USPS
    module Track
      class Shipment
        
        # Initialize a new Shipment.
        #
        #
        # Returns the newly initialized Shipment.
        def initialize(root)
          @root = root
        end

        # The list of packages in this shipment.
        #
        # Returns an array of Package objects.
        def packages
          @root.xpath("TrackResponse/TrackInfo").map do |package|
            Package.new(package)
          end
        end

        # The scheduled delivery date. If a specific time of day is available
        # then it will be set, otherwise the time will be set to noon. If no
        # delivery date is available, the result will be nil.
        #
        # Returns the Time of the delivery, or nil if none is available.
        def scheduled_delivery
         packages.first.scheduled_delivery
        end

        #
        # Returns the String delivery date or nil if none is available.
        def scheduled_delivery_date
         packages.first.scheduled_delivery_date
        end

        #
        # There is no delivery time for landmark
        def scheduled_delivery_time
          nil
        end
      end
    end
  end
end
