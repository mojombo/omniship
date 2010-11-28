module OmniShip
  module UPS
    module Track
      class Address
        # The Handsoap XML element representing the root response node.
        attr_accessor :root

        # Initialize a new Address.
        #
        # root - The root Package XML node.
        #
        # Returns the newly initialized Address.
        def initialize(root)
          @root = root
        end

        # Returns the String city or nil if none was set.
        def city
          @root.xpath('./ns:City/text()').to_s
        end

        # Returns the String state or province code or nil if none was set.
        def state_province_code
          @root.xpath('./ns:StateProvinceCode/text()').to_s
        end

        # Returns the String country code or nil if none was set.
        def country_code
          @root.xpath('./ns:CountryCode/text()').to_s
        end

        # This address as a single line comma delimited string.
        #
        # Returns the String address.
        def to_s
          parts = []
          parts << city if city
          parts << state_province_code if state_province_code
          parts << country_code if country_code
          parts.join(', ')
        end

        # Returns a Hash representation of this object.
        def to_hash
          {
            "City" => city,
            "StateProvinceCode" => state_province_code,
            "CountryCode" => country_code
          }
        end

        # Returns the String details of this object.
        def inspect
          "#<OmniShip::UPS::Track::Address #{to_s}>"
        end
      end
    end
  end
end
