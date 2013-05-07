module OmniShip
  module Landmark
    module Track
      class Address
        # Initialize a new Address.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Address.
        def initialize(root)
          @root = root
        end
        def root
          @root
        end

        def location
          @root.xpath("text()").to_s
        end

        # This address as a single line comma delimited string.
        #
        # Returns the String address.
        def to_s
         location
        end

        # Returns a Hash representation of this object.
        def to_hash
          {
            "Location" => self.to_s
          }
        end
      end
    end
  end
end
