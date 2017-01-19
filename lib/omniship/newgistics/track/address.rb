module Omniship
  module Newgistics
    module Track
      class Address
        def initialize(root)
          @root = root
        end

        def city
          @root["City"]
        end

        def state
          @root["State"]
        end

        def country
          nil # not supported
        end

        def postal_code
          @root["PostalCode"]
        end

        def to_s
         "#{city}, #{state} #{postal_code}"
        end
      end
    end
  end
end