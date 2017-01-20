module Omniship
  module Newgistics
    module Track
      class Error < TrackError
        NOT_FOUND_RESPONSE = 'No tracking data available'
        def initialize(root)
          error = root["ErrorMessage"]

          if error and error.start_with?(NOT_FOUND_RESPONSE)
            self.code = NOT_FOUND
          end
          super(message)
        end
      end
    end
  end
end