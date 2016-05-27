require 'spec_helper'

describe "OmniShip::Track" do
  it 'invalid tracking' do  
    expect { OmniShip::USPS.track(USPS_INVALID_TEST_NUMBER) }.to raise_error(OmniShip::USPS::Track::Error), "The Postal Service could not locate the tracking information for your request. Please verify your tracking number and try again later." 
  end

  # usps doesn't provide any tests numbers though. Should mock that out.
end