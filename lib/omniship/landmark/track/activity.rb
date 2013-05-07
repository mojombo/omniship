module OmniShip
  module Landmark
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
        # Returns the OmniShip::Landmark::Track::ActivityLocation.
        def location
          node = @root.xpath('Location')
          ActivityLocation.new(node)
        end

        def status
          node = @root.xpath('Status/text()').to_s

          node
        end

        # Returns a Hash representation of this object.
        def to_hash
          {
            "Location" => location.to_hash
          }
        end
      end
    end
  end
end
