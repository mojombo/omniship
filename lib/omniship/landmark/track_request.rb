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

              if Landmark.test_mode
                puts "TEST MODE ENABLED"
                xml.Test "true"
              end

              xml.RetrievalType "HISTORICAL" # required for all event data
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

              if Landmark.test_mode
                puts "TEST MODE ENABLED"
                xml.Test "true"
              end
              xml.RetrievalType "HISTORICAL" # required for all event data
              xml.ClientID Landmark.client_id
              xml.Reference reference_number

            }
          end

          builder
        end

        def self.get_response(request)
          
          if OmniShip.debug
            puts request.to_xml
          end
          response = RestClient.post endpoint, request.to_xml, :content_type => "text/xml", :accept => "text/xml"
          
          if OmniShip.debug
            puts response
          end
          response
        end

    end
  end
end
