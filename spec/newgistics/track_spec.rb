require 'spec_helper'

describe "Newgistics::Track" do
  it 'invalid tracking' do 
    expect { Omniship::Newgistics.track(NEWGISTICS_INVALID_ID) }.to raise_error(Omniship::Newgistics::Track::Error)
  end

  # newgistics test data is essentially random so we can't test for shipped/arrived packages. But we can test that things are formatted at least 

  it 'valid shipment' do 
    trk = Omniship::Newgistics.track(NEWGISTICS_VALID_ID)

    expect(trk.shipment).to_not be_nil
    expect(trk.shipment.packages.count).to_not eq(0)

    trk.shipment.packages.each do |package|
      expect(package.tracking_number).to eq(NEWGISTICS_VALID_ID)
      expect(package.has_left?).to_not be_nil
      expect(package.has_arrived?).to_not be_nil

      package.activity.each do |activity|
        expect(activity.status).to_not be_nil
        expect(activity.code).to_not be_nil
        expect(activity.location).to_not be_nil
        expect(activity.location.address).to_not be_nil
        expect(activity.location.address.location).to_not be_nil
      end
    end
  end
end

