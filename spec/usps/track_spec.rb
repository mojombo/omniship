require 'spec_helper'

describe "USPS::Track" do
  it 'invalid tracking' do  
    expect { Omniship::USPS.track(USPS_INVALID_NUMBER) }.to raise_error(Omniship::USPS::Track::Error)
  end

  # usps doesn't provide any tests numbers though. Should mock that out.
end