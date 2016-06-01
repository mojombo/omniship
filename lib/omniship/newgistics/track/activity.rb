module Omniship
  module Newgistics
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
        # Returns the Omniship::Newgistics::Track::ActivityLocation.
        def location
          ActivityLocation.new(@root)
        end

        def status
          @root["EventDescription"]
        end

        def code
          @root['Status']
        end
      end
    end
  end
end
