module OmniShip
  module UPS
    module Track
      class Shipment
        # The Handsoap XML element representing the root response node.
        attr_accessor :root

        # Initialize a new Shipment.
        #
        # root - The root Handsoap XML node.
        #
        # Returns the newly initialized Shipment.
        def initialize(root)
          @root = root
        end

        # The list of packages in this shipment.
        #
        # Returns an array of Package objects.
        def packages
          @root.xpath('./ns:Shipment/ns:Package').map do |package|
            Package.new(package)
          end
        end

        # The scheduled delivery date. If a specific time of day is available
        # then it will be set, otherwise the time will be set to noon. If no
        # delivery date is available, the result will be nil.
        #
        # Returns the Time of the delivery, or nil if none is available.
        def scheduled_delivery
          if date = scheduled_delivery_date
            year = date[0..3].to_i
            month = date[4..5].to_i
            day = date[6..7].to_i
            if time = scheduled_delivery_time
              hour = time[0..1].to_i
              minute = time[2..3].to_i
              second = time[4..5].to_i
              Time.utc(year, month, day, hour, minute, second)
            else
              Time.utc(year, month, day, 12, 0, 0)
            end
          end
        end

        # The scheduled delivery date as a String in YYYYMMDD format.
        #
        # Returns the String delivery date or nil if none is available.
        def scheduled_delivery_date
          @root.xpath('./ns:Shipment/ns:ScheduledDelivery/ns:Date/text()').to_s
        end

        # The scheduled delivery time as a String in HHMMSS format.
        #
        # Returns the String delivery time or nil if none is available.
        def scheduled_delivery_time
          @root.xpath('./ns:Shipment/ns:ScheduledDelivery/ns:Time/text()').to_s
        end

        # Returns a Hash representation of this object.
        def to_hash
          {
            "ScheduledDelivery" => scheduled_delivery.to_i,
            "Packages" => packages.map { |x| x.to_hash }
          }
        end

        # Returns the String details of this object.
        def inspect
          "#<OmniShip::UPS::Track::Shipment packages=#{packages.size}>"
        end
      end
    end
  end
end
