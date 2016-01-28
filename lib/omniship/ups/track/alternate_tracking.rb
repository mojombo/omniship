module OmniShip
  module UPS
    module Track
      class AlternateTracking

        PACKAGE_ID = 'P'
        MANIFEST_ID = 'S'
        MMS_NUMBER = 'T'
        POSTAL_SERVICE_TRACKING_ID = 'Q'
        
        attr_accessor :root

        # Initialize a new ActivityLocation.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized ActivityLocation.
        def initialize(root)
          @root = root
        end

        def type
          @root.xpath('./ns:Type').to_s
        end


        def value
          @root.xpath('./ns:Value').to_s
        end
      end
    end
  end
end
