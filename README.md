OmniShip
========


Currently Supported Calls
-------------------------

* Tracking Url     -> auto detects the provider based on the format of the tracking number
* Track            -> auto detects the provider based on the format of the tracking number

* UPS
  * Track

* Landmark Global
  * Landmark
    * Track
    * Track with reference

* USPS 
  * Return label

Usage
-----

Require the library:

    require 'rubygems'
    require 'omniship'

Set authentication details; you only need the details for services you'll be using; tracking url stuff doesn't need any authentications

    OmniShip::UPS.username = 'johndoe'
    OmniShip::UPS.password = '1234567890'
    OmniShip::UPS.token = 'QWERTYUIOP'

    OmniShip::USPS.userid = 'johndoe'
    OmniShip::USPS.password = '1234567890'

    OmniShip::Landmark.username = 'johndoe'
    OmniShip::Landmark.password = '1234567890'
    OmniShip::Landmark.client_id = '123'
    OmniShip::Landmark.test_mode = true # this turns Landmark's test mode on

    OmniShip.debug = true # with this enabled all xml request's and responses will be outputed to the log

    You can also do this in a config file
    config/settings.yaml

    
    OmniShip:
      debug: true
      
      USPS:
        userid: johndoe
        password: 1234567890

        retailer:
          name: Wantable 
          address: 223 N Water St. STE 300
        permit:
          number: 1234
          city: Milwaukee
          state: WI
          zip5: 53202
        pdu:
          po_box: 223 N Water ST STE 300
          city: Milwaukee 
          state: WI 
          zip5: 53202

      UPS:
        username: johndoe
        password: 1234567890

      Landmark:
        username: johndoe
        password: 1234567890
        client_id: 123
        debug: true


    and then set it up in an intializer like: 

        OmniShip.config('config/settings.yml')


UPS
---

Track a package by tracking number:

    trk = OmniShip::UPS.track('1z3050790327433970')

The result:

    trk.class
    # => OmniShip::UPS::TrackResponse

    trk.shipment.class
    # => OmniShip::UPS::Track::Shipment

    trk.shipment.scheduled_delivery
    # => Mon Nov 29 12:00:00 UTC 2010

    trk.shipment.packages.first.has_left?
    # => true / false

    trk.shipment.packages.first.has_arrived?
    # => true / false

    trk.shipment.packages.first.tracking_number
    # => "1z3050790327433970" 

    trk.shipment.packages


USPS
---

Make a return shipping label

* In order to use this USPS api you need to first obtain "Merchandise Return Service Permit"; directions for that are [here](https://www.usps.com/business/web-tools-apis/development-guide-v3-1c.pdf) in the section labeled "Obtain a Merchandise Return Service Permit"
* You can get a userid and password [here](http://www.usps.com/webtools/) but you need to call them at 1-800-344-7779 and have them activate it for the production server. The api doesn't seem to work with the test server at all; but they'll activate you no questions asked in like a 30 second phone call.

    customer = {
        :name => "Casey Juan Lopez", 
        :address1 => "223 N Water St.", 
        :address2 => "STE 300", 
        :city => "Milwaukee",
        :state => "WI",
        :zip5 => "53202"
    }
    options = {
        :window => "RIGHTWINDOW", 
        :service_type => "PRIORITY", 
        :delivery_confirmation => false, 
        :insurance_value => nil,  # only applicable if delivery_confirmation = true
        :weight => "13", # in ounces 
        :image_type => "TIF", #TIF/PDF 
        :rma => "asdfghjkl", 
        :rma_barcode => true,
    }

    label = OmniShip::USPS.return_label(customer, options)
    label.tracking_number
    # => "420532029311769932000000144614" 

    label.save("label_file")
    # creates file label_file.tif



Landmark Global
---------------

    trk = OmniShip::Landmark.track('LTN64365934N1')

also equivalent to 

    trk = OmniShip::Landmark.track_with_reference('REFID')

The result:

    trk.class
    # => OmniShip::Landmark::TrackResponse

    trk.shipment.class
    # => OmniShip::Landmark::Track::Shipment

    trk.shipment.scheduled_delivery
    # => Mon Nov 29 12:00:00 UTC 2010

    trk.shipment.packages.first.has_left?
    # => true / false
    
    trk.shipment.packages.first.has_arrived?
    # => true / false

    trk.shipment.packages.first.tracking_number
    # => "LTN62075201N1" 

    trk.shipment.packages

You can also track it if you don't know what provider it is (currently supports UPS and Landmark)

    trk = OmniShip.track('LTN64365934N1')

The result:

    trk.class
    # => OmniShip::Landmark::TrackResponse

    ....

Build the url to view tracking information from the tracking number (currently supports UPS, Landmark, FEDEX, USPS)

    OmniShip.tracking_url('1z3050790327433970')
    # => "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=1z3050790327433970"
    


