module OmniShip
  module USPS
    class TrackRequest
      def self.endpoint
        if USPS.test == true 
          'http://stg-production.shippingapis.com/ShippingAPI.dll?API=TrackV2&XML='
        else
          'http://production.shippingapis.com/ShippingAPI.dll?API=TrackV2&XML='
        end
      end

      def self.track(tracking_number)
        request = create_document(tracking_number)
        response = get_response(request)
        parsed_response = Nokogiri::XML::Document.parse(response)
        if parsed_response.xpath("TrackResponse/TrackInfo/Error").length > 0
          raise OmniShip::USPS::Track::Error.new(parsed_response)
        else
          OmniShip::USPS::TrackResponse.new(parsed_response)
        end
      end

      private 
      
      def self.create_document(tracking_number)
        builder = Nokogiri::XML::Builder.new do |xml|
          xml.TrackFieldRequest("USERID" =>"#{USPS.userid || ENV["USPS_USERID"]}") {
            xml.Revision "1"
            xml.ClientIp USPS.client_ip || ENV["USPS_CLIENT_ID"]
            xml.SourceId USPS.source_id || ENV["USPS_SOURCE_ID"]
            xml.TrackID("ID"=> tracking_number)
          }
        end
        builder
      end

      def self.get_response(request)
        if OmniShip.debug
          puts endpoint
          puts request.to_xml
        end
        response = RestClient.get URI.encode("#{endpoint}#{request.to_xml.gsub("<?xml version=\"1.0\"?>","")}"), :content_type => "text/xml", :accept => "text/xml"
        
        if OmniShip.debug
          puts response
        end
        response
      end

    end
  end
end
