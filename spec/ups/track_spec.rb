require 'spec_helper'

describe "UPS::Track" do
  it 'invalid tracking' do 
    expect { OmniShip::UPS.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(OmniShip::UPS::Track::Error), "Invalid tracking number"
  end
  it 'arrived shipment' do 
    trk = OmniShip::UPS.track(UPS_VALID_TEST_NUMBER_DELIVERED)
    expect(trk.has_arrived?).to be true
  end

  it 'left shipment' do 
    trk = OmniShip::UPS.track(UPS_VALID_TEST_NUMBER_ORIGIN_SCAN)
    expect(trk.has_arrived?).to be false
    expect(trk.has_left?).to be true
  end
end

