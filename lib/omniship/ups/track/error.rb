module Omniship
  module UPS
    module Track
      class Error < TrackError
        def initialize(root)
          @root = root
          @message = root.xpath("TrackResponse/Response/Error/ErrorDescription/text()").to_s
        end
      end
    end
  end
end