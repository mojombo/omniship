module Omniship
  module UPS
    module Track
      class Address < Omniship::Base

        def city
          @root.xpath('City/text()').to_s
        end

        def state
          @root.xpath('StateProvinceCode/text()').to_s
        end

        def country
          @root.xpath('CountryCode/text()').to_s
        end

        def postal_code
          @root.xpath('PostalCode/text()').to_s
        end

        def to_s
          "#{city}, #{state} #{postal_code} #{country}"
        end
      end
    end
  end
end