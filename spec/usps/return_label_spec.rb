require 'spec_helper'

describe "USPS::ReturnLabel" do
  it 'return label' do
    customer = {
        name: "Casey Juan Lopez", 
        address1: "223 N Water St.", 
        address2: "STE 300", 
        city: "Milwaukee",
        state: "WI",
        zip5: "53202"
    }
    options = {
        window: "RIGHTWINDOW", 
        service_type: "PRIORITY", 
        delivery_confirmation: false, 
        insurance_value: nil,  # only applicable if delivery_confirmation = true
        weight: "13", # in ounces 
        image_type: "TIF", #TIF/PDF 
        rma: "asdfghjkl", 
        rma_barcode: true,
    }

    label = Omniship::USPS.return_label(customer, options)
    expect(label.tracking_number).to_not be_nil

    label.save("label.tif")
  end
end