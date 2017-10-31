module Omniship
  module Landmark
    module Track
      class Error < TrackError
        NOT_FOUND_RESPONSE = "Could not find shipment"
        def initialize(root)
          message = root.xpath("TrackResponse").xpath("Errors").children.map do |err|
            "#{err.xpath("ErrorCode").text} - #{err.xpath("ErrorMessage").text}"
          end.join(", ")

          if message.include?(NOT_FOUND_RESPONSE)
            self.code = NOT_FOUND
          end

          super(message)
        end
      end
    end
  end
end