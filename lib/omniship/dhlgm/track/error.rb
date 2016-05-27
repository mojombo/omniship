module OmniShip
  module DHLGM
    module Track
      class Error < StandardError
        def initialize(root)
          @root = root
          @message = root.xpath("track/error/description/text()").to_s
        end
      end
    end
  end
end