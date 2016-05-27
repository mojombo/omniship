require 'spec_helper'

describe "DHLGM::Track" do
  it 'invalid tracking' do 
    expect { OmniShip::DHLGM.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(OmniShip::DHLGM::Track::Error), "No results for your tracking number."
  end

  # I could not find any valid test numbers. Should mock that out.
end

