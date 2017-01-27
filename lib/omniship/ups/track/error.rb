module Omniship
  module UPS
    module Track
      class Error < TrackError
        NOT_FOUND_RESPONSES = ["Invalid tracking number", "Tracking Information not found"]
        def initialize(root)
          message = root.xpath("TrackResponse/Response/Error/ErrorDescription/text()").to_s
          if NOT_FOUND_RESPONSES.any?{|r| message.include?(r) }
            self.code = NOT_FOUND
          end
          super(message)
        end
      end
    end
  end
end