ENV['RACK_ENV'] ||= 'test'
require 'bundler/setup'
Bundler.setup

require 'omniship'

require File.join(File.dirname(__FILE__), *%w[.. lib omniship])

LANDMARK_VALID_TEST_REFERENCE = 'W557443587'
LANDMARK_VALID_TEST_NUMBER = "LTN17080940N1"
LANDMARK_INVALID_TEST_NUMBER = "notvalid"
UPS_VALID_TEST_NUMBER_DELIVERED = '1Z12345E0291980793'
UPS_VALID_TEST_NUMBER_ORIGIN_SCAN = '1Z12345E1392654435'
UPS_INVALID_TEST_NUMBER = '1Z12345E020527079'
UPSMI_TEST_NUMBER = 'cgish000116630'
USPS_INVALID_TEST_NUMBER = 'notvalid'

RSpec.configure do |config|
  config.before(:each) {
    config_file = File.join(File.dirname(__FILE__), *%w[config.yml])

    if File.exist?(config_file)
      OmniShip.config(config_file)
    end

    OmniShip.debug = false
    OmniShip::Landmark.test_mode = false  # not using test mode because "responses are randomized.  Some requests will succeed and some will fail with different error messages"
                                          # from https://mercury.landmarkglobal.com/clients/KnowledgeBase/index.php?topic_name=Track+API+Request&hash=539fd53b59e3bb12d203f45a912eeaf2
    OmniShip::UPS.test = true
    OmniShip::USPS.test = true
  }
end
