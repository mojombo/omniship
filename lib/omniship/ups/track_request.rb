module OmniShip
  module UPS
    class TrackRequest < Handsoap::Service
      endpoint :uri => 'https://wwwcie.ups.com/webservices/Track', :version => 1

      def on_create_document(doc)
        doc.alias 'upss', 'http://www.ups.com/XMLSchema/XOLTWS/UPSS/v1.0'
        doc.alias 'track', 'http://www.ups.com/XMLSchema/XOLTWS/Track/v1.1'
        doc.alias 'com', 'http://www.ups.com/XMLSchema/XOLTWS/Common/v1.0'

        doc.find("Header").add "upss:UPSSecurity" do |sec|
          sec.add "upss:UsernameToken" do |ut|
            ut.add "upss:Username", UPS.username
            ut.add "upss:Password", UPS.password
          end
          sec.add "upss:ServiceAccessToken" do |tok|
            tok.add "upss:AccessLicenseNumber", UPS.token
          end
        end
      end

      def on_response_document(doc)
        doc.add_namespace 'trk', 'http://www.ups.com/XMLSchema/XOLTWS/Track/v1.1'
      end

      def track(tracking_number)
        response = invoke('track:TrackRequest') do |body|
          body.add('com:Request') do |request|
            request.add('com:RequestOption', '1')
          end
          body.add('track:InquiryNumber', tracking_number)
        end

        root = response.document.xpath('//ns:TrackResponse', ns).first
        OmniShip::UPS::TrackResponse.new(root)
        # p xml_to_str(node, './ns:Shipment/ns:ScheduledDelivery/ns:Date/text()')
      end

      def ns
        { 'ns' => 'http://www.ups.com/XMLSchema/XOLTWS/Track/v1.1' }
      end
    end
  end
end
