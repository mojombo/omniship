module Omniship
  module USPS
    module Track
      class Error < TrackError
        NOT_FOUND_RESPONSE = "The Postal Service could not locate the tracking information"
        def initialize(root)
          message = root.xpath("TrackResponse/TrackInfo/Error/Description/text()").to_s
          if message.start_with?(NOT_FOUND_RESPONSE)
            self.code = NOT_FOUND
          end
          super(message)
        end
      end
    end
  end
end