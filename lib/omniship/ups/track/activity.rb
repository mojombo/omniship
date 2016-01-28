module OmniShip
  module UPS
    module Track
      class Activity
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
          node = @root.xpath('ActivityLocation')
          ActivityLocation.new(node)
        end

        def status
          node = @root.xpath('Status/StatusType/Description').text

          node
        end

        def code 
          @root.xpath('Status/StatusType/Code').text
        end
      end
    end
  end
end
