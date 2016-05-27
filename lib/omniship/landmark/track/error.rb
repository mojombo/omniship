module OmniShip
  module Landmark
    module Track
      class Error < StandardError
        def initialize(root)
          @root = root
          @message = root.xpath("TrackResponse").xpath("Errors").children.map do |err|
            "#{err.xpath("ErrorCode").text} - #{err.xpath("ErrorMessage").text}"
          end.join(", ")
        end
      end
    end
  end
end