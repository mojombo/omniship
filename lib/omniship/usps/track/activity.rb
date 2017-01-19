module Omniship
  module USPS
    module Track
      class Activity

        def initialize(root)
          @root = root
        end

        def address
          Address.new(@root)
        end

        def status
          @root.xpath('Event/text()').to_s
        end

        def code
          @root.xpath('EventCode/text()').to_s
        end
      end
    end
  end
end
