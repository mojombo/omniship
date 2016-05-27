require 'spec_helper'

describe "DHLGM::Track" do
  it 'invalid tracking' do 
    expect { Omniship::DHLGM.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(Omniship::DHLGM::Track::Error)
  end

  # I could not find any valid test numbers. Should mock that out.
end

