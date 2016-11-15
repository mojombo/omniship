require 'spec_helper'

describe "Landmark::Track" do
  it 'invalid tracking' do 
    expect { Omniship::Landmark.track(LANDMARK_INVALID_NUMBER) }.to raise_error(Omniship::Landmark::Track::Error)
  end

  it 'valid tracking' do 
    LANDMARK_VALID_NUMBERS.each do |tracking|
      trk = Omniship::Landmark.track(tracking)
      expect(trk.has_arrived?).to be true
    end
  end

  it 'valid tracking by reference' do 
    trk = Omniship::Landmark.track_with_reference(LANDMARK_VALID_REFERENCE)
    expect(trk.has_arrived?).to be true
  end
end