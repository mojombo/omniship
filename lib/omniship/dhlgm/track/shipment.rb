module OmniShip
  module DHLGM
    module Track
      class Shipment
        attr_accessor :root

        # Initialize a new Shipment.
        #
        #
        # Returns the newly initialized Shipment.
        def initialize(root)
          @root = root
        end

        def root
          @root
        end

        # The list of packages in this shipment.
        #
        # Returns an array of Package objects.
        def packages
          [Package.new(@root)] # DHLGM only supports one package per shipment
        end

        # The scheduled delivery date. If a specific time of day is available
        # then it will be set, otherwise the time will be set to noon. If no
        # delivery date is available, the result will be nil.
        #
        # Returns the Time of the delivery, or nil if none is available.
        def scheduled_delivery
         # not supported by DHLGM
         nil
        end

        #
        # Returns the String delivery date or nil if none is available.
        def scheduled_delivery_date
         # not supported by DHLGM
         nil 
        end

        #
        # There is no delivery time for DHLGM
        def scheduled_delivery_time
          # not supported by DHLGM
          nil
        end
      end
    end
  end
end
