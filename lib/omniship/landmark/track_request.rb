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

      def self.track_with_reference(reference_number)
        request = create_document_with_reference(reference_number)
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

        def self.create_document_with_reference(reference_number)
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.TrackRequest {
              xml.Login {
                xml.Username Landmark.username
                xml.Password Landmark.password
              }
              #debug xml.Test "true"
              xml.RetrievalType "HISTORICAL" # required for all event data
              xml.ClientID Landmark.client_id
              xml.Reference reference_number

            }
          end

          builder
        end

        def self.get_response(request)
           #debug puts request.to_xml
          response = RestClient.post endpoint, request.to_xml, :content_type => "text/xml", :accept => "text/xml"
           #debug puts response
          response
        end

    end
  end
end
