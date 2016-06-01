module Omniship
  module DHLGM
    module Track
      class Error < TrackError
        def initialize(root)
          @root = root
          @message = root.xpath("track/error/description/text()").to_s
        end
      end
    end
  end
end