require 'spec_helper'

describe "Landmark::Track" do
  it 'invalid tracking' do 
    expect { OmniShip::Landmark.track(LANDMARK_INVALID_TEST_NUMBER) }.to raise_error(OmniShip::Landmark::Track::Error), "Lookup - Could not find shipment in our system."
  end

  it 'valid tracking' do 
    trk = OmniShip::Landmark.track(LANDMARK_VALID_TEST_NUMBER)
    expect(trk.has_arrived?).to be true
  end

  it 'valid tracking by reference' do 
    trk = OmniShip::Landmark.track_with_reference(LANDMARK_VALID_TEST_REFERENCE)
    expect(trk.has_arrived?).to be true
  end
end