require 'spec_helper'

describe "UPS::Track" do
  it 'invalid tracking' do 
    expect { Omniship::UPS.track(UPS_INVALID_TEST_NUMBER) }.to raise_error(Omniship::UPS::Track::Error)
  end
  it 'arrived shipment' do 
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_DELIVERED)
    expect(trk.has_arrived?).to be true
  end

  it 'left shipment' do 
    trk = Omniship::UPS.track(UPS_VALID_TEST_NUMBER_ORIGIN_SCAN)
    expect(trk.has_arrived?).to be false
    expect(trk.has_left?).to be true
  end
end

