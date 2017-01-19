module Omniship
  module Newgistics
    module Track
      class Error < TrackError
        def initialize(message)
          super(message)
        end
      end
    end
  end
end