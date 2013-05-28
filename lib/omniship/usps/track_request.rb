module OmniShip
  module USPS
    class TrackRequest
      def self.endpoint
        'http://production.shippingapis.com/ShippingAPI.dll?API=TrackV2&XML='
      end

      def self.track(tracking_number)
        request = create_document(tracking_number)
        response = get_response(request)
        OmniShip::USPS::TrackResponse.new(Nokogiri::XML::Document.parse(response))
      end

      private 
        def self.create_document(tracking_number)
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.TrackFieldRequest("USERID" =>"#{USPS.userid}") {
              xml.Revision "1"
              xml.ClientIp USPS.client_ip
              xml.SourceId USPS.source_id
              xml.TrackID("ID"=> "#{tracking_number}")
            }
          end
          builder
        end

        def self.get_response(request)
          
          if OmniShip.debug
            puts request.to_xml
          end
          response = RestClient.get URI.encode(endpoint+request.to_xml.gsub("<?xml version=\"1.0\"?>","")), :content_type => "text/xml", :accept => "text/xml"
          
          if OmniShip.debug
            puts response
          end
          response
        end

    end
  end
end
