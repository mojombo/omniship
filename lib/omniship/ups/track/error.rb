module OmniShip
  module UPS
    module Track
      class Error < StandardError
        def initialize(root)
          @root = root
          @message = root.xpath("TrackResponse/Response/Error/ErrorDescription/text()").to_s
        end
      end
    end
  end
end