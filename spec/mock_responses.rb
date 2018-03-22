module MockResponses
  # here are some known API responses we can use to test our xml parsing
  def track_dhlgm_response
    "<track>
      <shipment>        
        <trackingnumber>1071180100692707</trackingnumber>
        <deliveryconfirm>9261299996349762041684</deliveryconfirm>
        <customerconfirm>S725347170</customerconfirm>
        <address1>1 BRUCKNER BLVD</address1>
        <address2/>
        <city>BRONX</city>
        <state>NY</state>
        <zip>10454</zip>
        <weight>2.928</weight>
        <shipped>1/10/2017</shipped>
        <signedby/>
        <event>
          <code>600</code>
          <date>1/17/2017</date>
          <time>12:26 PM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>DELIVERED</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>598</code>
          <date>1/17/2017</date>
          <time>8:53 AM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>OUT FOR DELIVERY</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>539</code>
          <date>1/17/2017</date>
          <time>8:43 AM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>SORTING COMPLETE</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>520</code>
          <date>1/16/2017</date>
          <time>12:41 PM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>ARRIVAL AT POST OFFICE</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>540</code>
          <date>1/15/2017</date>
          <time>4:05 AM ET</time>
          <city>New York</city>
          <state>NY</state>
          <description>PROCESSED THROUGH SORT FACILITY</description>
          <postalcode>10199</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>526</code>
          <date>1/15/2017</date>
          <time>2:50 AM ET</time>
          <city>Bronx</city>
          <state>NY</state>
          <description>ARRIVED USPS SORT FACILITY</description>
          <postalcode>10454</postalcode>
          <country>US</country>
        </event>
          <event>
          <code>400</code>
          <date>1/12/2017</date>
          <time>7:32 AM ET</time>
          <city>Secaucus</city>
          <state>NJ</state>
          <description>TENDERED TO USPS</description>
          <postalcode>07094</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>350</code>
          <date>1/12/2017</date>
          <time>12:59 AM ET</time>
          <city>Secaucus</city>
          <state>NJ</state>
          <description>ARRIVAL DESTINATION DHL DISTRIBUTION CENTER</description>
          <postalcode>07094</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>300</code>
          <date>1/11/2017</date>
          <time>4:49 AM CT</time>
          <city>Melrose Park</city>
          <state>IL</state>
          <description>DEPARTURE DHL DISTRIBUTION CENTER</description>
          <postalcode>60160</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>220</code>
          <date>1/10/2017</date>
          <time>11:23 PM CT</time>
          <city>Melrose Park</city>
          <state>IL</state>
          <description>PROCESSED</description>
          <postalcode>60160</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>200</code>
          <date>1/10/2017</date>
          <time>9:09 PM CT</time>
          <city>Melrose Park</city>
          <state>IL</state>
          <description>ARRIVAL DHL DISTRIBUTION CENTER</description>
          <postalcode>60160</postalcode>
          <country>US</country>
        </event>
        <event>
          <code>132</code>
          <date>1/10/2017</date>
          <time>7:42 PM EST</time>
          <city/>
          <state/>
          <description>EN ROUTE TO DHL ECOMMERCE</description>
          <postalcode/>
          <country/>
        </event>
        <event>
          <code>99</code>
          <date>1/10/2017</date>
          <time>7:34 PM EST</time>
          <city/>
          <state/>
          <description>ELECTRONIC NOTIFICATION RECEIVED: YOUR ORDER HAS BEEN PROCESSED AND TRACKING WILL BE UPDATED SOON</description>
          <postalcode/>
          <country/>
        </event>
        
      </shipment>

    </track>"
  end

  def track_dhlgm_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <track>
      <error>
        <code>400</code>
        <description>No results for your tracking number.</description>
      </error>
    </track>"
  end

  def track_landmark_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
       <Result>
        <Success>true</Success>
        <Packages>
         <Package>
          <TrackingNumber>JJD0002250044220462</TrackingNumber>
          <LandmarkTrackingNumber>LTN17080940N1</LandmarkTrackingNumber>
          <PackageReference>EW187536225</PackageReference>
          <Events>
             <Event>
              <Status>Shipment Data Uploaded</Status>
              <DateTime>2014-07-01 19:48:02</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>50</EventCode>
             </Event>
             <Event>
              <Status>Processed</Status>
              <DateTime>2014-07-03 12:09:36</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>75</EventCode>
             </Event>
             <Event>
              <Status>Scanned at Landmark crossdock facility</Status>
              <DateTime>2014-07-07 06:37:27</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>250</EventCode>
             </Event>
             <Event>
              <Status>Transmitted customs information</Status>
              <DateTime>2014-07-07 09:18:45</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>125</EventCode>
             </Event>
             <Event>
              <Status>Crossing border and in transit to carrier hub</Status>
              <DateTime>2014-07-07 09:30:42</DateTime>
              <Location>Romulus, MI</Location>
              <EventCode>150</EventCode>
             </Event>
             <Event>
              <Status>Received in destination country</Status>
              <DateTime>2014-07-09 07:53:47</DateTime>
              <Location>Heston, MIDDX</Location>
              <EventCode>155</EventCode>
             </Event>
             <Event>
              <Status>Parcel collected</Status>
              <DateTime>2014-07-09 20:41:00</DateTime>
              <Location>Hayes service centre</Location>
              <EventCode>200</EventCode>
             </Event>
             <Event>
              <Status>Despatched from service centre</Status>
              <DateTime>2014-07-09 21:11:00</DateTime>
              <Location>Hayes service centre</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel received at service centre</Status>
              <DateTime>2014-07-10 17:20:00</DateTime>
              <Location>Hatfield terminal</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Despatched from service centre</Status>
              <DateTime>2014-07-10 17:22:00</DateTime>
              <Location>Hatfield terminal</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel received at service centre</Status>
              <DateTime>2014-07-11 04:17:00</DateTime>
              <Location>Manchester service centre</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel out for delivery</Status>
              <DateTime>2014-07-11 07:05:00</DateTime>
              <Location>Manchester home delivery</Location>
              <EventCode>300</EventCode>
             </Event>
             <Event>
              <Status>Parcel received by local delivery courier</Status>
              <DateTime>2014-07-11 09:38:00</DateTime>
              <Location>Manchester home delivery</Location>
              <EventCode>275</EventCode>
             </Event>
             <Event>
              <Status>Parcel delivered</Status>
              <DateTime>2014-07-11 16:42:00</DateTime>
              <Location>Manchester home delivery</Location>
              <EventCode>500</EventCode>
             </Event>
          </Events>
         </Package>
        </Packages>
       </Result>
    </TrackResponse>"
  end

  def track_landmark_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <Errors>
        <Error>
          <ErrorCode>Lookup</ErrorCode>
          <ErrorMessage>Could not find shipment with  tracking number # 9402116901279224348471blah in our system.&amp;lt;br&amp;gt;&amp;lt;br&amp;gt;&amp;lt;span style=\"font-weight: normal; font-size: 14px\"&amp;gt;You can track this shipment on the bpost tracking site &amp;lt;ul class='navlist'&amp;gt;&amp;lt;li&amp;gt;&amp;lt;a href='http://www.bpost2.be/bpostinternational/track_trace/find.php?search=s&amp;lng=en&amp;trackcode=9402116901279224348471blah' target='_blank' style='font-size:14px;'&amp;gt;Track with bpost&amp;lt;/a&amp;gt;&amp;lt;/li&amp;gt;&amp;lt;/ul&amp;gt;&amp;lt;/span&amp;gt;</ErrorMessage>
        </Error>
      </Errors>
      <Result>
        <Success>false</Success>
        <ResultMessage>See Errors element for error details</ResultMessage>
      </Result>
    </TrackResponse>"
  end

  def track_newgistics_response
    '{
      "Packages":[
        {
         "ActualEstimatedDeliveryDate":null,
         "CarrierCode":"NEWG",
         "CarrierCodeDescription":"Newgistics, Inc.",
         "CarrierName":"United States Postal Service",
         "CarrierService":"USPS Return Delivery Unit 5DZ",
         "CarrierServiceCode":null,
         "CarrierServiceCodeDescription":null,
         "ErrorMessage":"",
         "EstimatedDeliveryDate":null,
         "EstimatedDeliveryText":null,
         "FinalCarrier":null,
         "MaxEstimatedDeliveryDate":null,
         "MerchantName":null,
         "MinEstimatedDeliveryDate":null,
         "PackageTrackingEvents":[
          {
             "CSREventMessage":"Package delivered to returns processing facility.",
             "CarrierCode":"SDRC",
             "CarrierDescription":"Delivered",
             "City":"Milwaukee",
             "ConsumerEventMessage":"Package delivered to returns processing facility.",
             "CreateDate":"\/Date(-62135575200000-0600)\/",
             "Date":"\/Date(1469163600000-0500)\/",
             "Description":"Delivered",
             "EventCode":"DRC",
             "EventDescription":"Delivered to Return Center",
             "FacilityID":52687,
             "FacilityName":"Wantable Returns",
             "PostalCode":"53204",
             "State":"WI",
             "Time":"\/Date(1484870400000-0600)\/",
             "TrackingKey":"320908566",
             "UpdateDate":"\/Date(-62135575200000-0600)\/"
          },
          {
             "CSREventMessage":"Package in-transit to returns processing facility.",
             "CarrierCode":"SS",
             "CarrierDescription":"In transit",
             "City":"Carol Stream",
             "ConsumerEventMessage":"Package in-transit to returns processing facility.",
             "CreateDate":"\/Date(-62135575200000-0600)\/",
             "Date":"\/Date(1469077200000-0500)\/",
             "Description":"In transit",
             "EventCode":"DNF",
             "EventDescription":"Departing Newgistics Facility",
             "FacilityID":47662,
             "FacilityName":"ORD2",
             "PostalCode":"60188",
             "State":"IL",
             "Time":"\/Date(1484887140000-0600)\/",
             "TrackingKey":"320908566",
             "UpdateDate":"\/Date(-62135575200000-0600)\/"
          },
          {
             "CSREventMessage":"Package scanned by Newgistics.",
             "CarrierCode":"IPS",
             "CarrierDescription":"Arrived at Shipping Facility",
             "City":"Carol Stream",
             "ConsumerEventMessage":"Package scanned by Newgistics.",
             "CreateDate":"\/Date(-62135575200000-0600)\/",
             "Date":"\/Date(1468904400000-0500)\/",
             "Description":"Arrived at Shipping Facility",
             "EventCode":"IPS",
             "EventDescription":"Inducted into Newgistics Network",
             "FacilityID":47662,
             "FacilityName":"ORD2",
             "PostalCode":"60188",
             "State":"IL",
             "Time":"\/Date(1484882280000-0600)\/",
             "TrackingKey":"320908566",
             "UpdateDate":"\/Date(-62135575200000-0600)\/"
          },
          {
             "CSREventMessage":"Received by the USPS",
             "CarrierCode":"PTS03",
             "CarrierDescription":"Arrival at USPS",
             "City":"MILWAUKEE",
             "ConsumerEventMessage":"Received by the USPS",
             "CreateDate":"\/Date(-62135575200000-0600)\/",
             "Date":"\/Date(1468904400000-0500)\/",
             "Description":"Arrival at USPS",
             "EventCode":"PUU",
             "EventDescription":"Picked up by USPS",
             "FacilityID":14512,
             "FacilityName":"WEST MILWAUKEE",
             "PostalCode":"532195012",
             "State":"WI",
             "Time":"\/Date(1484829060000-0600)\/",
             "TrackingKey":"320908566",
             "UpdateDate":"\/Date(-62135575200000-0600)\/"
          }
         ],
         "ReferenceNumber":"000511171",
         "Service":"RETURN",
         "ShipToAddressLine1":"112 E Mineral Street",
         "ShipToAddressLine2":"",
         "ShipToCity":"Milwaukee",
         "ShipToName":"Wantable Returns",
         "ShipToPostalCode":"53204",
         "ShipToState":"WI",
         "Signer":null,
         "Status":"Delivered",
         "TrackingNumber":"7250053219012360010005111713",
         "UnitOfMeasure":"pounds",
         "Weight":3.5260
        }
       ]
    }'
  end

  def track_newgistics_not_found_response
    '{
       "Packages":[
          {
             "ActualEstimatedDeliveryDate":null,
             "CarrierCode":null,
             "CarrierCodeDescription":null,
             "CarrierName":"",
             "CarrierService":"",
             "CarrierServiceCode":null,
             "CarrierServiceCodeDescription":null,
             "ErrorMessage":"No tracking data available for 9402116901279224348471blah.",
             "EstimatedDeliveryDate":null,
             "EstimatedDeliveryText":null,
             "FinalCarrier":null,
             "MaxEstimatedDeliveryDate":null,
             "MerchantName":null,
             "MinEstimatedDeliveryDate":null,
             "PackageTrackingEvents":null,
             "ReferenceNumber":null,
             "Service":"UNKNOWN",
             "ShipToAddressLine1":null,
             "ShipToAddressLine2":null,
             "ShipToCity":null,
             "ShipToName":null,
             "ShipToPostalCode":null,
             "ShipToState":null,
             "Signer":null,
             "Status":"NotFound",
             "TrackingNumber":"9402116901279224348471blah",
             "UnitOfMeasure":null,
             "Weight":null
          }
       ]
    }'
  end

  def track_usps_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <TrackInfo ID=\"9402116901279224348471\">
        <Class>First-Class Package Service</Class>
        <ClassOfMailCode>FC</ClassOfMailCode>
        <DestinationCity>SAN DIEGO</DestinationCity>
        <DestinationState>CA</DestinationState>
        <DestinationZip>92104</DestinationZip>
        <EmailEnabled>true</EmailEnabled>
        <KahalaIndicator>false</KahalaIndicator>
        <MailTypeCode>DM</MailTypeCode>
        <MPDATE>2017-01-11 21:31:51.000000</MPDATE>
        <MPSUFFIX>886842393</MPSUFFIX>
        <OriginCity>MILWAUKEE</OriginCity>
        <OriginState>WI</OriginState>
        <OriginZip>53204</OriginZip>
        <PodEnabled>true</PodEnabled>
        <PredictedDeliveryDate>January 17, 2017</PredictedDeliveryDate>
        <RestoreEnabled>false</RestoreEnabled>
        <RramEnabled>false</RramEnabled>
        <RreEnabled>false</RreEnabled>
        <Service>Signature Confirmation&amp;lt;SUP&gt;&amp;#153;&amp;lt;/SUP&gt;</Service>
        <ServiceTypeCode>021</ServiceTypeCode>
        <Status>Delivered, Left with Individual</Status>
        <StatusCategory>Delivered</StatusCategory>
        <StatusSummary>Your item was delivered to an individual at the address at 12:15 pm on January 17, 2017 in SAN DIEGO, CA 92104.</StatusSummary>
        <TABLECODE>T</TABLECODE>
        <TrackSummary>
          <EventTime>12:15 pm</EventTime>
          <EventDate>January 17, 2017</EventDate>
          <Event>Delivered, Left with Individual</Event>
          <EventCity>SAN DIEGO</EventCity>
          <EventState>CA</EventState>
          <EventZIPCode>92104</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name>J G</Name>
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>01</EventCode>
          <DeliveryAttributeCode>04</DeliveryAttributeCode>
        </TrackSummary>
        <TrackDetail>
          <EventTime>7:09 am</EventTime>
          <EventDate>January 17, 2017</EventDate>
          <Event>Out for Delivery</Event>
          <EventCity>SAN DIEGO</EventCity>
          <EventState>CA</EventState>
          <EventZIPCode>92104</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>OF</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>6:59 am</EventTime>
          <EventDate>January 17, 2017</EventDate>
          <Event>Sorting Complete</Event>
          <EventCity>SAN DIEGO</EventCity>
          <EventState>CA</EventState>
          <EventZIPCode>92104</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>PC</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>3:42 am</EventTime>
          <EventDate>January 17, 2017</EventDate>
          <Event>Arrived at Post Office</Event>
          <EventCity>SAN DIEGO</EventCity>
          <EventState>CA</EventState>
          <EventZIPCode>92108</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>07</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>5:57 pm</EventTime>
          <EventDate>January 15, 2017</EventDate>
          <Event>Departed USPS Destination Facility</Event>
          <EventCity>SAN DIEGO</EventCity>
          <EventState>CA</EventState>
          <EventZIPCode>92199</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>10</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>5:57 pm</EventTime>
          <EventDate>January 15, 2017</EventDate>
          <Event>Arrived at USPS Destination Facility</Event>
          <EventCity>SAN DIEGO</EventCity>
          <EventState>CA</EventState>
          <EventZIPCode>92199</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>10</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>12:23 am</EventTime>
          <EventDate>January 14, 2017</EventDate>
          <Event>In Transit to Destination</Event>
          <EventCity />
          <EventState />
          <EventZIPCode />
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>EX</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>10:00 pm</EventTime>
          <EventDate>January 13, 2017</EventDate>
          <Event>Departed USPS Facility</Event>
          <EventCity>OAK CREEK</EventCity>
          <EventState>WI</EventState>
          <EventZIPCode>53154</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>EF</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>12:23 am</EventTime>
          <EventDate>January 13, 2017</EventDate>
          <Event>Arrived at USPS Origin Facility</Event>
          <EventCity>OAK CREEK</EventCity>
          <EventState>WI</EventState>
          <EventZIPCode>53154</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>10</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime>11:08 pm</EventTime>
          <EventDate>January 12, 2017</EventDate>
          <Event>Accepted at USPS Origin Facility</Event>
          <EventCity>MILWAUKEE</EventCity>
          <EventState>WI</EventState>
          <EventZIPCode>53204</EventZIPCode>
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>OA</EventCode>
        </TrackDetail>
        <TrackDetail>
          <EventTime />
          <EventDate>January 11, 2017</EventDate>
          <Event>Pre-Shipment Info Sent to USPS, USPS Awaiting Item</Event>
          <EventCity />
          <EventState />
          <EventZIPCode />
          <EventCountry />
          <FirmName />
          <Name />
          <AuthorizedAgent>false</AuthorizedAgent>
          <EventCode>MA</EventCode>
        </TrackDetail>
      </TrackInfo>
    </TrackResponse>"
  end

  def track_usps_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <TrackInfo ID=\"1234567890\">
        <Error>
          <Number>-2147219302</Number>
          <Description>The Postal Service could not locate the tracking information for your request. Please verify your tracking number and try again later.</Description>
          <HelpFile />
          <HelpContext />
        </Error>
      </TrackInfo>
    </TrackResponse>"
  end

  def track_ups_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <Response>
        <TransactionReference>
          <CustomerContext>9cbf1901-c9d8-419e-b52c-e224ad693781</CustomerContext>
          <XpciVersion>1.0</XpciVersion>
        </TransactionReference>
        <ResponseStatusCode>1</ResponseStatusCode>
        <ResponseStatusDescription>Success</ResponseStatusDescription>
      </Response>
      <Shipment>
        <Shipper>
          <ShipperNumber>1161WA</ShipperNumber>
          <Address>
            <AddressLine1>112 E MINERAL ST</AddressLine1>
            <City>MILWAUKEE</City>
            <StateProvinceCode>WI</StateProvinceCode>
            <PostalCode>53204  1876</PostalCode>
            <CountryCode>US</CountryCode>
          </Address>
        </Shipper>
        <ShipTo>
          <Address>
            <City>SANTA CLARA</City>
            <StateProvinceCode>CA</StateProvinceCode>
            <PostalCode>95053</PostalCode>
            <CountryCode>US</CountryCode>
          </Address>
        </ShipTo>
        <ShipmentWeight>
          <UnitOfMeasurement>
            <Code>LBS</Code>
          </UnitOfMeasurement>
          <Weight>3.90</Weight>
        </ShipmentWeight>
        <Service>
          <Code>003</Code>
          <Description>UPS GROUND</Description>
        </Service>
        <ReferenceNumber>
          <Code>01</Code>
          <Value>W886314636-875</Value>
        </ReferenceNumber>
        <ShipmentIdentificationNumber>1Z1161WA0394673667</ShipmentIdentificationNumber>
        <PickupDate>20170110</PickupDate>
        <DeliveryDateUnavailable>
          <Type>Scheduled Delivery</Type>
          <Description>Scheduled Delivery Date is not currently available, please try back later</Description>
        </DeliveryDateUnavailable>
        <Package>
          <TrackingNumber>1Z1161WA0394673667</TrackingNumber>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SANTA CLARA</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <PostalCode>95053</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <Code>AI</Code>
              <Description>DOCK</Description>
              <SignedForByName>DANIGNACIO</SignedForByName>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>D</Code>
                <Description>DELIVERED</Description>
              </StatusType>
              <StatusCode>
                <Code>KB</Code>
              </StatusCode>
            </Status>
            <Date>20170117</Date>
            <Time>101600</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SUNNYVALE</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>OUT FOR DELIVERY</Description>
              </StatusType>
              <StatusCode>
                <Code>DS</Code>
              </StatusCode>
            </Status>
            <Date>20170117</Date>
            <Time>055500</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SUNNYVALE</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>X</Code>
                <Description>DELIVERY HAS BEEN RESCHEDULED DUE TO HOLIDAY CLOSURES. / YOUR DELIVERY HAS BEEN RESCHEDULED FOR THE NEXT BUSINESS DAY.</Description>
              </StatusType>
              <StatusCode>
                <Code>AZ</Code>
              </StatusCode>
            </Status>
            <Date>20170116</Date>
            <Time>100000</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SUNNYVALE</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>DESTINATION SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>DS</Code>
              </StatusCode>
            </Status>
            <Date>20170116</Date>
            <Time>044900</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SUNNYVALE</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>ARRIVAL SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>AR</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>060500</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SOUTH SAN FRANCISCO</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>DEPARTURE SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>DP</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>043900</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SOUTH SAN FRANCISCO</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>ARRIVAL SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>AR</Code>
              </StatusCode>
            </Status>
            <Date>20170113</Date>
            <Time>211000</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SAN PABLO</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>DEPARTURE SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>DP</Code>
              </StatusCode>
            </Status>
            <Date>20170113</Date>
            <Time>201500</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>SAN PABLO</City>
                <StateProvinceCode>CA</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>ARRIVAL SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>AR</Code>
              </StatusCode>
            </Status>
            <Date>20170113</Date>
            <Time>143400</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>HODGKINS</City>
                <StateProvinceCode>IL</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>DEPARTURE SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>DP</Code>
              </StatusCode>
            </Status>
            <Date>20170111</Date>
            <Time>090100</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>HODGKINS</City>
                <StateProvinceCode>IL</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>ARRIVAL SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>AR</Code>
              </StatusCode>
            </Status>
            <Date>20170111</Date>
            <Time>070600</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>OAK CREEK</City>
                <StateProvinceCode>WI</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>DEPARTURE SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>DP</Code>
              </StatusCode>
            </Status>
            <Date>20170111</Date>
            <Time>051800</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>OAK CREEK</City>
                <StateProvinceCode>WI</StateProvinceCode>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>ORIGIN SCAN</Description>
              </StatusType>
              <StatusCode>
                <Code>OR</Code>
              </StatusCode>
            </Status>
            <Date>20170110</Date>
            <Time>201200</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <CountryCode>US</CountryCode>
              </Address>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>M</Code>
                <Description>BILLING INFORMATION RECEIVED</Description>
              </StatusType>
              <StatusCode>
                <Code>MP</Code>
              </StatusCode>
            </Status>
            <Date>20170110</Date>
            <Time>123448</Time>
          </Activity>
          <PackageWeight>
            <UnitOfMeasurement>
              <Code>LBS</Code>
            </UnitOfMeasurement>
            <Weight>3.90</Weight>
          </PackageWeight>
          <ReferenceNumber>
            <Code>01</Code>
            <Value>W886314636-875</Value>
          </ReferenceNumber>
        </Package>
      </Shipment>
    </TrackResponse>"
  end

  def track_ups_mi_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <Response>
        <TransactionReference>
          <CustomerContext>ad037137-1281-4e73-9260-0b681485657a</CustomerContext>
          <XpciVersion>1.0</XpciVersion>
        </TransactionReference>
        <ResponseStatusCode>1</ResponseStatusCode>
        <ResponseStatusDescription>Success</ResponseStatusDescription>
      </Response>
      <Shipment>
        <InquiryNumber>
          <Code>03</Code>
          <Description>Mail Innovations Tracking Number</Description>
          <Value>801677101298096996</Value>
        </InquiryNumber>
        <ShipmentType>
          <Code>03</Code>
          <Description>Mail Innovations</Description>
        </ShipmentType>
        <Shipper>
          <Address>
            <City>Milwauke</City>
            <StateProvinceCode>WI</StateProvinceCode>
            <PostalCode>53204</PostalCode>
            <CountryCode>US</CountryCode>
          </Address>
        </Shipper>
        <ShipTo>
          <Address>
            <City>DUNWOODY</City>
            <StateProvinceCode>GA</StateProvinceCode>
            <PostalCode>30338</PostalCode>
            <CountryCode>US</CountryCode>
          </Address>
        </ShipTo>
        <ShipmentWeight>
          <UnitOfMeasurement>
            <Code>LBS</Code>
          </UnitOfMeasurement>
          <Weight>0.5050</Weight>
        </ShipmentWeight>
        <Service>
          <Code>702</Code>
          <Description>UPS Mail Innovations Expedited</Description>
        </Service>
        <ReferenceNumber>
          <Code>96</Code>
          <Value>W025284315C226</Value>
        </ReferenceNumber>
        <PickupDate>20170112</PickupDate>
        <DeliveryDateTime>
          <Type>
            <Code>01</Code>
            <Description>Delivery</Description>
          </Type>
          <Date>20170116</Date>
          <Time>1314</Time>
        </DeliveryDateTime>
        <Package>
          <TrackingNumber>801677101298096996</TrackingNumber>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Atlanta</City>
                <StateProvinceCode>GA</StateProvinceCode>
                <PostalCode>30338</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>IC</Type>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>D</Code>
                <Description>Package delivered by post office</Description>
              </StatusType>
              <StatusCode>
                <Code>D</Code>
              </StatusCode>
            </Status>
            <Date>20170116</Date>
            <Time>1314</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Atlanta</City>
                <StateProvinceCode>GA</StateProvinceCode>
                <PostalCode>30338</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>GATLA</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Package transferred to post office</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>1511</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Morrow</City>
                <StateProvinceCode>GA</StateProvinceCode>
                <PostalCode>30260</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>GATLA</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Package departed UPS Mail Innovations facility enroute to USPS for induction</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>1022</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Morrow</City>
                <StateProvinceCode>GA</StateProvinceCode>
                <PostalCode>30260</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>GATLA</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Postage Paid/Ready for destination post office entry</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>1018</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Atlanta</City>
                <StateProvinceCode>GA</StateProvinceCode>
                <PostalCode>30338</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>IC</Type>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Electronic Shipment Information Received for Package by Post Office</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>0947</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Morrow</City>
                <StateProvinceCode>GA</StateProvinceCode>
                <PostalCode>30260</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>GATLA</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Package received for sort by destination UPS Mail Innovations facility</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170114</Date>
            <Time>0650</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Bensenville</City>
                <StateProvinceCode>IL</StateProvinceCode>
                <PostalCode>60106</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>ILCST</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Package transferred to destination UPS Mail Innovations facility</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170113</Date>
            <Time>0721</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Bensenville</City>
                <StateProvinceCode>IL</StateProvinceCode>
                <PostalCode>60106</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>ILCST</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Package processed by UPS Mail Innovations origin facility</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170113</Date>
            <Time>0043</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Bensenville</City>
                <StateProvinceCode>IL</StateProvinceCode>
                <PostalCode>60106</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>ILCST</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>I</Code>
                <Description>Package received for processing by UPS Mail Innovations</Description>
              </StatusType>
              <StatusCode>
                <Code>I</Code>
              </StatusCode>
            </Status>
            <Date>20170113</Date>
            <Time>0005</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <City>Milwauke</City>
                <StateProvinceCode>WI</StateProvinceCode>
                <PostalCode>53204</PostalCode>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
                <Code>ILCST</Code>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>P</Code>
                <Description>Shipment tendered to UPS Mail Innovations</Description>
              </StatusType>
              <StatusCode>
                <Code>P</Code>
              </StatusCode>
            </Status>
            <Date>20170112</Date>
            <Time>2353</Time>
          </Activity>
          <Activity>
            <ActivityLocation>
              <Address>
                <CountryCode>US</CountryCode>
              </Address>
              <TransportFacility>
                <Type>VT</Type>
              </TransportFacility>
            </ActivityLocation>
            <Status>
              <StatusType>
                <Code>M</Code>
                <Description>Shipment information received by UPS Mail Innovations</Description>
              </StatusType>
              <StatusCode>
                <Code>M</Code>
              </StatusCode>
            </Status>
            <Date>20170112</Date>
            <Time>1553</Time>
          </Activity>
          <PackageWeight>
            <UnitOfMeasurement>
              <Code>LBS</Code>
            </UnitOfMeasurement>
            <Weight>0.5050</Weight>
          </PackageWeight>
          <ReferenceNumber>
            <Code>96</Code>
            <Value>W025284315C226</Value>
          </ReferenceNumber>
          <AlternateTrackingInfo>
            <Type>Q</Type>
            <Value>92748999964209543475518096</Value>
          </AlternateTrackingInfo>
        </Package>
      </Shipment>
    </TrackResponse>"
  end

  def track_ups_mi_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <Response>
        <TransactionReference>
          <CustomerContext>4951bd50-6af6-4d92-abb4-c5025de11d42</CustomerContext>
          <XpciVersion>1.0</XpciVersion>
        </TransactionReference>
        <ResponseStatusCode>0</ResponseStatusCode>
        <ResponseStatusDescription>Failure</ResponseStatusDescription>
        <Error>
          <ErrorSeverity>Hard</ErrorSeverity>
          <ErrorCode>155002</ErrorCode>
          <ErrorDescription>Mail Innovations Tracking Information not found.</ErrorDescription>
        </Error>
      </Response>
    </TrackResponse>"
  end

  def track_ups_not_found_response
    "<?xml version=\"1.0\" encoding=\"UTF-8\"?>
    <TrackResponse>
      <Response>
        <TransactionReference>
          <CustomerContext>52c13489-7a9f-4cb1-b0b8-951274a4fc6c</CustomerContext>
          <XpciVersion>1.0</XpciVersion>
        </TransactionReference>
        <ResponseStatusCode>0</ResponseStatusCode>
        <ResponseStatusDescription>Failure</ResponseStatusDescription>
        <Error>
          <ErrorSeverity>Hard</ErrorSeverity>
          <ErrorCode>150022</ErrorCode>
          <ErrorDescription>Invalid tracking number</ErrorDescription>
        </Error>
      </Response>
    </TrackResponse>"
  end
end