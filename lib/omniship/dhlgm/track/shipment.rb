module OmniShip
  module DHLGM
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
          [Package.new(@root)] # DHLGM only supports one package per shipment
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
