module Omniship
  module UPS
    module Track
      class Shipment
        def initialize(root)
          @root = root
        end

        def packages
          @root.xpath('Package').map do |package|
            Package.new(package)
          end
        end

        def scheduled_delivery
          Omniship::UPS.parse_timestamp(@root.xpath('ScheduledDeliveryDate').text)
        end
      end
    end
  end
end
