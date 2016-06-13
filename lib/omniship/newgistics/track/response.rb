module Omniship
  module Newgistics
    module Track
      class Response

        def initialize(root)
          @root = root
        end

        def shipment
          Shipment.new(@root)
        end

        def has_left?
          shipment.packages.length > 0 and shipment.packages.all?(&:has_left?)
        end

        def has_arrived?
          shipment.packages.length > 0 and shipment.packages.all?(&:has_arrived?)
        end
      end
    end
  end
end