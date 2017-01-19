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
    expect(trk.shipment.packages.first.activity.first.address.to_s).to eq("SAN DIEGO, CA 92104")
    expect(trk.shipment.packages.first.activity.first.timestamp).to_not be_nil
  end
  # usps doesn't provide any tests numbers though. Should mock that out.
end