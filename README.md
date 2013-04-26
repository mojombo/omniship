OmniShip
========

WARNING: This library is Super Duper Alpha. You've been warned.

Everyone likes to ship stuff around the world. And as coders, we like to
interact with our favorite shipper via their API.

OmniShip uses Semantic Versioning and TomDoc. Look 'em up.


Currently Supported Calls
-------------------------

* UPS
  * Track


Usage
-----

Require the library:

    require 'rubygems'
    require 'omniship'

Set authentication details:

    OmniShip::UPS.username = 'johndoe'
    OmniShip::UPS.password = 'xk793Ab4G'
    OmniShip::UPS.token = 'DFFBF2984239A2C6'

    You can also do this in a config file
    config/settings.yaml

    UPS:
      username: wantable
      password: Republic1
      token: 6C9B1DAA44D98663

    and then set it like: 

        OmniShip.config('config/settings.yml')

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

    trk.shipment.packages


Build the url to view tracking information from the tracking number

    OmniShip.tracking_url('1z3050790327433970')
    # => "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=1z3050790327433970"
    

