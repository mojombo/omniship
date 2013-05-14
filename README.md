OmniShip
========


Currently Supported Calls
-------------------------

* OmniShip.tracking_url     -> auto detects the provider based on the format of the tracking number
* OmniShip.track            -> auto detects the provider based on the format of the tracking number

* UPS
  * Track

* Landmark
  * Track
  * Track with reference


Usage
-----

Require the library:

    require 'rubygems'
    require 'omniship'

Set authentication details; you only need the details for services you'll be using

    OmniShip::UPS.username = 'johndoe'
    OmniShip::UPS.password = 'xk793Ab4G'
    OmniShip::UPS.token = 'DFFBF2984239A2C6'


    OmniShip::Landmark.username = 'johndoe'
    OmniShip::Landmark.password = 'xk793Ab4G'
    OmniShip::Landmark.client_id = '123'
    OmniShip::Landmark.test_mode = true # this turns Landmark's test mode on

    OmniShip.debug = true # with this enabled all xml request's and responses will be outputed to the log

    You can also do this in a config file
    config/settings.yaml

    UPS:
      username: johndoe
      password: xk793Ab4G
      token: DFFBF2984239A2C6

    Landmark:
      username: johndoe
      password: xk793Ab4G
      client_id: 123
      debug: true

    OmniShip:
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

Landmark
--------

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
    


