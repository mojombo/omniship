module Omniship
  module UPS
    module Track
      class Activity < Omniship::Base

        def address
          Address.new(@root.xpath('ActivityLocation').xpath('Address'))
        end

        def status
          @root.xpath('Status/StatusType/Description').text
        end

        def code 
          @root.xpath('Status/StatusType/Code').text
        end

        def timestamp
          date = @root.xpath('Date/text()').to_s
          time = @root.xpath('Time/text()').to_s
          Omniship::UPS.parse_timestamp(date, time)
        end
      end
    end
  end
end
