module Omniship
  module Newgistics
    module Track
      class Activity

        def initialize(root)
          @root = root
        end

        def address
          Address.new(@root)
        end

        def status
          @root["EventDescription"]
        end

        def code
          @root['CarrierCode']
        end

        #  "Date":"\/Date(1469163600000-0500)\/",
        #  "Time":"\/Date(1484870400000-0600)\/",
        def timestamp
          Omniship::Newgistics.parse_timestamp(@root['Date'], @root['Time'])
        end
      end
    end
  end
end
