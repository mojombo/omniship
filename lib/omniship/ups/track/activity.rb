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

        def status
          node = @root.xpath('./ns:Status/ns:Description').to_s

          node
        end
      end
    end
  end
end
