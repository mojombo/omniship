module Omniship
  module USPS
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
          "#{@root.xpath("EventCity/text()").to_s} #{@root.xpath("EventState/text()").to_s}, #{@root.xpath("EventZIPCode/text()").to_s} #{@root.xpath("EventCountry/text()").to_s}"
        end

        # This address as a single line comma delimited string.
        #
        # Returns the String address.
        def to_s
         location
        end
      end
    end
  end
end
