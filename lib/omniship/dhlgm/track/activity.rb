module Omniship
  module DHLGM
    module Track
      class Activity < Omniship::Base

        def address
          Address.new(@root)
        end

        def status
          @root.xpath('description/text()').to_s
        end

        def code
          @root.xpath('code/text()').to_s
        end

        def timestamp
          date = @root.xpath('date/text()').to_s
          time = @root.xpath('time/text()').to_s
          Omniship::DHLGM.parse_timestamp(date, time)
        end
      end
    end
  end
end