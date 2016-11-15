module Omniship
  module UPS
    module Track
      class ActivityLocation
         

        # Initialize a new ActivityLocation.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized ActivityLocation.
        def initialize(root)
          @root = root
        end

        # The address of this activity location.
        #
        # Returns the Omniship::UPS::Track::Address.
        def address
          node = @root.xpath('Address')
          Address.new(node)
        end
      end
    end
  end
end
