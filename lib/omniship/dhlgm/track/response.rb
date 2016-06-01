module Omniship
  module DHLGM
    module Track
      class Response
        def initialize(root)
          @root = root
        end

        def shipment
          Track::Shipment.new(@root.xpath("track/shipment"))
        end

        def has_left?
          shipment.packages.all?(&:has_left?)
        end

        def has_arrived?
          shipment.packages.all?(&:has_arrived?)
        end
      end
    end
  end
end