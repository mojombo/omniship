module OmniShip
  module UPS
    class TrackRequest
      TEST_URL = 'https://wwwcie.ups.com/ups.app/xml/Track'
      LIVE_URL = 'https://onlinetools.ups.com/ups.app/xml/Track'

      def self.endpoint
        if UPS.test == true 
          TEST_URL
        else
          LIVE_URL
        end
      end


      def self.track(tracking_number, mail_innovations=false)
        request = create_document(tracking_number, mail_innovations)
        response = get_response(request)
        OmniShip::UPS::TrackResponse.new(Nokogiri::XML::Document.parse(response))
      end

      private 

      def self.create_document(tracking_number, mail_innovations=false)
        access_request = Nokogiri::XML::Builder.new do |xml|
          
          xml.AccessRequest {
            xml.AccessLicenseNumber UPS.token
            xml.UserId UPS.username
            xml.Password UPS.password
          }
        end
        tracking_request = Nokogiri::XML::Builder.new do |xml|
          xml.TrackRequest {
            xml.Request {
              xml.TransactionReference{
                xml.CustomerContext SecureRandom.uuid
                xml.XpciVersion '1.0'
              }
              xml.RequestAction 'Track'
              xml.RequestOption '1'       # request all activity
            }
            if mail_innovations
              xml.TrackingOption '03' # mail innovations tracking requires this
            end
            xml.TrackingNumber tracking_number
          }
        end
        access_request.to_xml + tracking_request.to_xml
      end

      def self.get_response(request)
        
        if OmniShip.debug
          puts request
        end
        response = RestClient.post URI.encode(endpoint), request, content_type: "text/xml", accept: "text/xml", ssl_version: 'TLSv1_2'
        
        if OmniShip.debug
          puts response
        end
        response
      end

    end
  end
end
