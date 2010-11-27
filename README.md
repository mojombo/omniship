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

Track a package by tracking number:

    trk = OmniShip::UPS.track('1z3050790327433970')

The result:

    trk.class
    # => OmniShip::UPS::TrackResponse

    trk.shipment.class
    # => OmniShip::UPS::Track::Shipment

    trk.shipment.scheduled_delivery
    # => Mon Nov 29 12:00:00 UTC 2010