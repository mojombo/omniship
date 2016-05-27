module OmniShip
  module UPS
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
          @root.xpath('Package').map do |package|
            Package.new(package, self)
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
            Time.utc(year, month, day, 12, 0, 0) rescue nil
          end
        end

        # The scheduled delivery date as a String in YYYYMMDD format.
        #
        # Returns the String delivery date or nil if none is available.
        def scheduled_delivery_date
          date = @root.xpath('ScheduledDeliveryDate').text
          
          date.blank? ? nil : date
        end

      end
    end
  end
end
