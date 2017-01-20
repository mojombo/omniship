module Omniship
  module UPS
    module Track
      class AlternateTracking < Omniship::Base

        PACKAGE_ID = 'P'
        MANIFEST_ID = 'S'
        MMS_NUMBER = 'T'
        POSTAL_SERVICE_TRACKING_ID = 'Q'
        
        def type
          @root.xpath('Type').text
        end


        def value
          @root.xpath('Value').text
        end
      end
    end
  end
end
