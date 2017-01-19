module Omniship
  module Landmark
    module Track
      class Address
        def initialize(root)
          @root = root
        end

        def city
          nil # not supported
        end

        def state
          nil # not supported
        end

        def country
          nil # not supported
        end

        def postal_code
          nil # not supported
        end

        def to_s
         @root.xpath("text()").to_s
        end
      end
    end
  end
end