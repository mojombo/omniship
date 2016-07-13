module Omniship
  module Newgistics
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

        def location
          "#{@root["City"]} #{@root["State"]}, #{@root["PostalCode"]}"
        end

        def to_s
         location
        end
      end
    end
  end
end
