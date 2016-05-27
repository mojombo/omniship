module Omniship
  module UPS
    module Track
      class AlternateTracking

        PACKAGE_ID = 'P'
        MANIFEST_ID = 'S'
        MMS_NUMBER = 'T'
        POSTAL_SERVICE_TRACKING_ID = 'Q'
        
         

        # Initialize a new ActivityLocation.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized ActivityLocation.
        def initialize(root)
          @root = root
        end

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
