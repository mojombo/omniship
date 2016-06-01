module Omniship
  module Newgistics
    module Track
      class Error < TrackError
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