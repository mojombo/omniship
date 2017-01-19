module Omniship
  module DHLGM
    module Track
      class Shipment
         
        def initialize(root)
          @root = root
        end

        def packages
          [Package.new(@root)] # DHLGM only supports one package per shipment
        end

        # There is no delivery time for DHLGM
        def scheduled_delivery
          nil
        end
      end
    end
  end
end
