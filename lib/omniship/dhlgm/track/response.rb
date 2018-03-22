module Omniship
  module DHLGM
    module Track
      class Response < Omniship::Base
        
        def shipment
          Track::Shipment.new(@root.xpath("track/shipment"))
        end

        def has_left?
          !shipment.packages.empty? and shipment.packages.all?(&:has_left?)
        end

        def has_arrived?
          !shipment.packages.empty? and shipment.packages.all?(&:has_arrived?)
        end
      end
    end
  end
end