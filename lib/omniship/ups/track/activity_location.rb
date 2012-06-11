module OmniShip
  module UPS
    module Track
      class ActivityLocation
        # The Handsoap XML element representing the root response node.
        attr_accessor :root

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
        # Returns the OmniShip::UPS::Track::Address.
        def address
          node = @root.xpath('./ns:Address')
          Address.new(node)
        end

        # Returns a Hash representation of this object.
        def to_hash
          {
            "Address" => address.to_hash
          }
        end

      end
    end
  end
end
