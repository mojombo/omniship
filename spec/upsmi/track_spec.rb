require 'spec_helper'

describe "UPSMI::Track" do
  it 'invalid tracking' do 
    expect { Omniship::UPSMI.track(UPSMI_TEST_NUMBER)  }.to_not raise_error(Omniship::TrackError)
    expect { Omniship::UPSMI.track(UPS_INVALID_TEST_NUMBER)  }.to raise_error(Omniship::TrackError)
  end
end

