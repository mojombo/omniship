module Omniship
  module USPS
    module Track
      class Activity

        def initialize(root)
          @root = root
        end

        def address
          Address.new(@root)
        end

        def status
          @root.xpath('Event/text()').to_s
        end

        def code
          @root.xpath('EventCode/text()').to_s
        end

        def timestamp
          date = @root.xpath('EventDate/text()').to_s
          time = @root.xpath('EventTime/text()').to_s
          Omniship::USPS.parse_timestamp(date, time)
        end
      end
    end
  end
end