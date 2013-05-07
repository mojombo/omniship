module OmniShip
  module Landmark
    class TrackRequest
      def self.endpoint
        'https://mercury.landmarkglobal.com/api/api.php'
      end

      def self.track(tracking_number)
        request = create_document(tracking_number)
        response = get_response(request)
        OmniShip::Landmark::TrackResponse.new(Nokogiri::XML::Document.parse(response))
      end

      def self.track_with_reference(reference_number, client_id)
        request = create_document_with_reference(reference_number, client_id)
        response = get_response(request)
        OmniShip::Landmark::TrackResponse.new(Nokogiri::XML::Document.parse(response))
      end

      private 
        def self.create_document(tracking_number)
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.TrackRequest {
              xml.Login {
                xml.Username Landmark.username
                xml.Password Landmark.password
              }
              xml.TrackingNumber tracking_number

            }
          end

          builder
        end

        def self.create_document_with_reference(reference_number, client_id)
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.TrackRequest {
              xml.Login {
                xml.Username Landmark.username
                xml.Password Landmark.password
              }
              xml.Test "true"
              xml.ClientID client_id
              xml.Reference reference_number

            }
          end

          builder
        end

        def self.get_response(request)
          response = RestClient.post endpoint, request.to_xml, :content_type => "text/xml", :accept => "text/xml"
        end

    end
  end
end
