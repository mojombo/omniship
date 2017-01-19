module Omniship
  module USPS
    module Track
      class Address
        def initialize(root)
          @root = root
        end

        def city
          @root.xpath("EventCity/text()").to_s
        end

        def state
          @root.xpath("EventState/text()").to_s
        end

        def country
          @root.xpath("EventCountry/text()").to_s
        end

        def postal_code
          @root.xpath("EventZIPCode/text()").to_s
        end

        def to_s
         "#{city}, #{state} #{postal_code} #{country}"
        end
      end
    end
  end
end