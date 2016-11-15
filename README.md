Omniship
========


Currently Supported Calls
-------------------------

* [Tracking Url](#tracking-url)
  * auto detects the provider based on the format of the tracking number
  * works with UPS, USPS, DHL Global Mail (if Omniship::DHLGM.mailer_id is set and matches), FedEx, Landmark Global, UPS Mail Innovations, Newgistics (barcode only)

* [Track](#track)
  * auto detects the provider based on the format of the tracking number
  * works with UPS, USPS, DHL Global Mail (if Omniship::DHLGM.mailer_id is set and matches), FedEx, Landmark Global, UPS Mail Innovations , Newgistics (barcode only)

* [UPS and UPS Mail Innovations](#ups-and-ups-mail-innovations)
  * Track

* [Landmark Global](#landmark-global)
  * Landmark
    * Track
    * Track with reference

* [USPS](#usps)
  * Track
  * Return label

* [DHL Global Mail](#dhl-global-mail)
    * Track

* [Newgistics](#newgistics)
    * Track

Configuration
-----

Add to your gemfile

```ruby
gem 'omniship', git: 'git://github.com/wantable/omniship.git'
```

Set authentication details; you only need the details for services you'll be using; tracking url stuff doesn't need any authentications

```ruby
Omniship::UPS.username = 'johndoe'
Omniship::UPS.password = '1234567890'
Omniship::UPS.token = 'QWERTYUIOP'

Omniship::USPS.userid = 'johndoe'
Omniship::USPS.password = '1234567890'

Omniship::Landmark.username = 'johndoe'
Omniship::Landmark.password = '1234567890'
Omniship::Landmark.client_id = '123'
Omniship::Landmark.test_mode = true # this turns Landmark's test mode on

Omniship::DHLGM.username = 'johndoe'
Omniship::DHLGM.password = '1234567890'
Omniship::DHLGM.mailer_id = '1234567890' # this is required to detect the shipper type, since USPS and DHL are otherwise indistinguisiblle

Omniship.debug = true # with this enabled all xml request's and responses will be outputed to the log
```

You can also do this in a config file
config/settings.yaml

```yml
Omniship:
  debug: true
  
  USPS:
    userid: johndoe
    password: 1234567890
    client_ip: 127.0.0.1
    source_id: Wantable, Inc. 

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


  DHLGM:
    username: johndoe
    password: 1234567890
```


and then set it up in an intializer like: 

```ruby 
Omniship.config('config/settings.yml')
```


UPS and UPS Mail Innovations
---

Track

```ruby
trk = Omniship::UPS.track('1z3050790327433970')
```

or if its a mail innovations package

```ruby
trk = Omniship::UPS.track('123456790', true)
trk.class
# => Omniship::UPS::Track::Response

trk.shipment.class
# => Omniship::UPS::Track::Shipment

trk.shipment.scheduled_delivery
# => Mon Nov 29 12:00:00 UTC 2010

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false

trk.shipment.packages.first.tracking_number
# => "123456790" 
```

USPS
---

Track

```ruby
trk = Omniship::USPS.track('9400111201080302430600')
trk.class
# => Omniship::USPS::Track::Response

trk.shipment.class
# => Omniship::USPS::Track::Shipment

trk.shipment.scheduled_delivery
# => Mon Nov 29 12:00:00 UTC 2010

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false

trk.shipment.packages.first.tracking_number
# => "9400111201080302430600" 
```

Make a return shipping label

* In order to use this USPS api you need to first obtain "Merchandise Return Service Permit"; directions for that are [here](https://www.usps.com/business/web-tools-apis/development-guide-v3-1c.pdf) in the section labeled "Obtain a Merchandise Return Service Permit"
* You can get a userid and password [here](http://www.usps.com/webtools/) but you need to call them at 1-800-344-7779 and have them activate it for the production server. The api doesn't seem to work with the test server at all; but they'll activate you no questions asked in like a 30 second phone call.


Additional config

```ruby
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
```

```ruby
label = Omniship::USPS.return_label(customer, options)
label.tracking_number
# => "420532029311769932000000144614" 

label.save("label_file")
# creates file label_file.tif
```



Landmark Global
---------------

Track
```ruby
trk = Omniship::Landmark.track('LTN64365934N1')
```

Track with reference

```ruby
trk = Omniship::Landmark.track_with_reference('REFID')
trk.class
# => Omniship::Landmark::Track::Response

trk.shipment.class
# => Omniship::Landmark::Track::Shipment

trk.shipment.scheduled_delivery
# => Mon Nov 29 12:00:00 UTC 2010

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false

trk.shipment.packages.first.tracking_number
# => "LTN62075201N1" 
```

DHL Global Mail
---------------

Track

```ruby
trk = Omniship::DHLGM.track('12345')
trk.class
# => Omniship::DHLGM::Track::Response

trk.shipment.class
# => Omniship::DHLGM::Track::Shipment

trk.shipment.scheduled_delivery - not supported by DHL Global Mail
# => nil

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false
```

Newgistics
---------------

Track

```ruby
trk = Omniship::Newgistics.track('12345')
trk.class
# => Omniship::Newgistics::Track::Response

trk.shipment.class
# => Omniship::Newgistics::Track::Shipment

trk.shipment.scheduled_delivery - not supported by DHL Global Mail
# => nil

trk.shipment.packages.first.has_left?
# => true / false

trk.shipment.packages.first.has_arrived?
# => true / false
```

Track
-----

You can also track it if you don't know what provider it is (currently supports UPS, USPS, Landmark, and DHL Global Mail [only if Omniship::DHLGM.mailer_id configured and matches], Newgistics [using barcode])

```ruby
trk = Omniship.track('LTN64365934N1')
trk.class
# => Omniship::Landmark::Track::Response
```

Tracking Url
------------

Build the url to view tracking information from the tracking number (currently supports UPS, UPS Mail Innovations, USPS, DHL, DHL Global Mail [only if Omniship::DHLGM.mailer_id configured and matches], FedEx, Landmark Global, Newgistics [using barcode])

```
Omniship.tracking_url('1z3050790327433970')
# => "http://wwwapps.ups.com/WebTracking/track?track=yes&trackNums=1z3050790327433970"
```



