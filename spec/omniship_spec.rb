require 'spec_helper'

describe "Omniship" do
  it 'shipper label' do    
    LANDMARK_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::Landmark::LABEL), tracking
    end

    UPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::UPS::LABEL), tracking
    end

    DHLGM_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::DHLGM::LABEL), tracking
    end

     USPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::USPS::LABEL), tracking
    end

    UPSMI_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::UPSMI::LABEL), tracking
    end

    DHL_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::DHL::LABEL), tracking
    end

    FED_EX_VALID_NUMBERS.each do |tracking|
      expect(Omniship.shipper_label(tracking)).to eq(Omniship::FedEx::LABEL), tracking
    end

    NEWGISTICS_VALID_BARCODES.each do |barcode|
      expect(Omniship.shipper_label(barcode)).to eq(Omniship::Newgistics::LABEL), barcode
    end

    not_a_number = "NOT A NUMBER"
    expect { Omniship.shipper_label(not_a_number) }.to raise_error(Omniship::ProviderError)
  end

  it 'track' do    
    LANDMARK_VALID_NUMBERS.each do |tracking|
      expect(Omniship.track(tracking).class).to eq(Omniship::Landmark::Track::Response), tracking
    end

    expect(Omniship.track(UPS_VALID_TEST_NUMBER_DELIVERED).class).to eq(Omniship::UPS::Track::Response)

    DHLGM_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::DHLGM::Track::Error)
    end

    USPS_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::USPS::Track::Error)
    end

    UPSMI_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::UPS::Track::Error)
    end

    DHL_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::TrackError)
    end

    FED_EX_VALID_NUMBERS.each do |tracking|
      expect { Omniship.track(tracking) }.to raise_error(Omniship::TrackError)
    end

    not_a_number = "NOT A NUMBER"
    expect { Omniship.track(not_a_number) }.to raise_error(Omniship::ProviderError)
  end

  it 'tracking url' do    
    LANDMARK_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::Landmark::TRACKING_URL), tracking
    end

    UPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::UPS::TRACKING_URL), tracking
    end

    DHLGM_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::DHLGM::TRACKING_URL), tracking
    end

     USPS_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::USPS::TRACKING_URL), tracking
    end

    UPSMI_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::UPS::TRACKING_URL), tracking
    end

    DHL_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::DHL::TRACKING_URL), tracking
    end

    FED_EX_VALID_NUMBERS.each do |tracking|
      expect(Omniship.tracking_url(tracking)).to include(Omniship::FedEx::TRACKING_URL), tracking
    end

    not_a_number = "NOT A NUMBER"
    expect { Omniship.tracking_url(not_a_number) }.to raise_error(Omniship::ProviderError)
  end
end