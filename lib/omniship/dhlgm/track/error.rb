module Omniship
  module DHLGM
    module Track
      class Error < TrackError
        NOT_FOUND_RESPONSE = "400"
        def initialize(root)
          if root.xpath("track/error/code/text()").to_s == NOT_FOUND_RESPONSE
            self.code = NOT_FOUND
          end

          super(root.xpath("track/error/description/text()").to_s)
        end
      end
    end
  end
end