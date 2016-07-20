module Omniship
  module Newgistics
    module Track
      class Error < TrackError
        def initialize(message)
          @message = message
        end
      end
    end
  end
end