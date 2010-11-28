module OmniShip
  module UPS
    module Track
      class Activity
        # The Handsoap XML element representing the root response node.
        attr_accessor :root

        # Initialize a new Activity.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Activity.
        def initialize(root)
          @root = root
        end

        # The location of this activity event.
        #
        # Returns the OmniShip::UPS::Track::ActivityLocation.
        def location
          node = @root.xpath('./ns:ActivityLocation')
          ActivityLocation.new(node)
        end

        # Returns a Hash representation of this object.
        def to_hash
          {
            "Location" => location.to_hash
          }
        end

        # Returns the String details of this object.
        def inspect
          "#<OmniShip::UPS::Track::Activity location=#{location.address}>"
        end
      end
    end
  end
end
