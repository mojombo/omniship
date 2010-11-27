OmniShip
========

Everyone likes to ship stuff around the world. And as coders, we like to
interact with our favorite shipper via their API. 


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

    {
      :response => {
        :response_status => {
          :code => "1",
          :description => "Success"
        }
      },
      :shipment => {
        :inquiry_number => {
          :value => "1z3050790327433970"
        },
        :shipper => {
          :shipper_number => "790097",
          :address => {
            :address_line =>
            :city =>
            :state_province_code =>
            :postal_code =>
            :
          }
        }
      }
    }