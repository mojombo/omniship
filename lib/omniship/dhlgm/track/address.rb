module Omniship
  module DHLGM
    module Track
      class Address < Omniship::Base
        
        def city
          @root.xpath("city/text()").to_s
        end

        def state
          @root.xpath('state/text()').to_s
        end

        def country
          @root.xpath('country/text()').to_s
        end

        def postal_code
          @root.xpath('postalcode/text()').to_s
        end

        def to_s
          "#{city}, #{state} #{postal_code} #{country}"
        end
      end
    end
  end
end
