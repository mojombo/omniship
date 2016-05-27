module OmniShip
  module USPS
    module Track
      class Error < StandardError
        def initialize(root)
          @root = root
          @message = root.xpath("TrackResponse/TrackInfo/Error/Description/text()").to_s
        end
      end
    end
  end
end