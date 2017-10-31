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

    expect(trk.shipment.packages.last.activity.last.timestamp).to_not be_nil
  end

  it 'timestamp parsing' do 
    expect(Omniship::Landmark.parse_timestamp("2014-07-07 06:37:27").utc).to eq(Time.parse("2014-07-07 06:37:27 #{Omniship::Landmark::TIMEZONE}").utc)
  end

  it 'test xml parsing' do 
    trk = Omniship::Landmark::Track::Response.new(Nokogiri::XML::Document.parse(track_landmark_response))
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to be_nil
    activity = package.activity.first
    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("Romulus, MI")
    expect(activity.timestamp).to_not be_nil
  end

  it 'test xml parsing not found' do 
    error = Omniship::Landmark::Track::Error.new(Nokogiri::XML::Document.parse(track_landmark_not_found_response))
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end
end