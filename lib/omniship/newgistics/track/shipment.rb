module Omniship
  module Newgistics
    module Track
      class Shipment < Omniship::Base

        def packages
          @root["Packages"].map do |p|
            Package.new(p)
          end
        end

        def scheduled_delivery
          packages.first.scheduled_delivery
        end
      end
    end
  end
end
