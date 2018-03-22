require 'spec_helper'

describe "USPS::Track" do
  it 'invalid tracking' do
    expect { Omniship::USPS.track(USPS_INVALID_NUMBER) }.to raise_error(Omniship::USPS::Track::Error)
  end

  it 'timstamp parsing' do 
    expect(Omniship::USPS.parse_timestamp("January 17, 2017", "7:09 am")).to eq(Time.parse("2017-01-17 07:09"))
  end

  it 'test xml parsing' do 
    trk = Omniship::USPS::Track::Response.new(Nokogiri::XML::Document.parse(track_usps_response))
    expect(trk.has_left?).to eq true
    expect(trk.has_arrived?).to eq true
    package = trk.shipment.packages.first
    expect(package.tracking_number).to_not be_nil
    expect(trk.shipment.scheduled_delivery).to_not be_nil
    activity = package.activity.first
    expect(activity.code).to_not be_nil
    expect(activity.status).to_not be_nil
    expect(activity.address.to_s).to eq("SAN DIEGO, CA 92104")
    expect(activity.timestamp).to_not be_nil
  end

  it 'test xml parsing not found' do 
    error = Omniship::USPS::Track::Error.new(Nokogiri::XML::Document.parse(track_usps_not_found_response))
    expect(error.code).to eq(Omniship::TrackError::NOT_FOUND)
  end
  # usps doesn't provide any tests numbers though. Should mock that out.
end