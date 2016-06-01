module Omniship
  module DHLGM
    module Track
      class Activity


        # Initialize a new Activity.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Activity.
        def initialize(root)
          @root = root
        end

        def root
          @root
        end

        # The location of this activity event.
        #
        # Returns the Omniship::DHLGM::Track::ActivityLocation.
        def location
          ActivityLocation.new(@root)
        end

        def status
          node = @root.xpath('description/text()').to_s

          node
        end

        def code
          node = @root.xpath('code/text()').to_s

          node

        end
      end
    end
  end
end
