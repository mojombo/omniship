ENV['RACK_ENV'] ||= 'test'
require 'bundler/setup'
Bundler.setup

require 'omniship'

require File.join(File.dirname(__FILE__), *%w[.. lib omniship])

# these are production numbers from real shipments
# they are not varying enough to consider this a 100% test but they are a start at least

LANDMARK_VALID_REFERENCE = 'W557443587'
LANDMARK_VALID_NUMBERS = ["LTN17967560N1", "LTN17971770N1", "LTN18408072N1", "LTN20233051N1"]
UPS_VALID_NUMBERS = ["1Z1161WA0399155833", "1Z1161WA0390690959", "1Z1161WA0391050951", "1Z1161WA0390455534"]
USPS_VALID_NUMBERS = ["9201990148770008501221", "9201990148770064565861", "9405516901279224955476", "9400116901279224949502"]
UPSMI_VALID_NUMBERS = ["801677101399737254", "801677100190161691", "801677101395762662", "801677102292050302"]
DHL_VALID_NUMBERS = ['3208547941', '5972839611', '5972803815', '8010954000']
FED_EX_VALID_NUMBERS = ['262952560543252', '635519318996']
DHLGM_VALID_NUMBERS = ["9274812345678960036671", "9261212345678960028717", "9261212345678960399046", "9261212345678948635197"]

# test numbers I made up
DHL_TEST_MAILER_ID = '123456789'
LANDMARK_INVALID_NUMBER = "notvalid"
USPS_INVALID_NUMBER = 'notvalid'

# these are test numbers provided by UPS
UPS_VALID_TEST_NUMBER_DELIVERED = '1Z12345E0291980793'
UPS_VALID_TEST_NUMBER_ORIGIN_SCAN = '1Z12345E1392654435'
UPS_INVALID_TEST_NUMBER = '1Z12345E020527079'
UPSMI_TEST_NUMBER = 'cgish000116630'


RSpec.configure do |config|
  config.before(:each) {
    config_file = File.join(File.dirname(__FILE__), *%w[config.yml])

    if File.exist?(config_file)
      Omniship.config(config_file)
    end

    Omniship.debug = false

    Omniship::DHLGM.mailer_id = DHL_TEST_MAILER_ID
    Omniship::Landmark.test_mode = false  # not using test mode because "responses are randomized.  Some requests will succeed and some will fail with different error messages"
                                          # from https://mercury.landmarkglobal.com/clients/KnowledgeBase/index.php?topic_name=Track+API+Request&hash=539fd53b59e3bb12d203f45a912eeaf2
    Omniship::UPS.test = true
    Omniship::USPS.test = true
  }
end
