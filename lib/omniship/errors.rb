module Omniship
  class ProviderError < StandardError
  end
  class TrackError < StandardError
    NOT_FOUND = 'not found'
    attr_accessor :code
  end
end