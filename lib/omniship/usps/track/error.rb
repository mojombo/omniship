module Omniship
  module USPS
    module Track
      class Error < TrackError
        def initialize(root)
          @root = root
          @message = root.xpath("TrackResponse/TrackInfo/Error/Description/text()").to_s
        end
      end
    end
  end
end