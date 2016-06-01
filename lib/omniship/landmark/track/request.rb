module Omniship
  module Landmark
    module Track
      class Request
        def self.endpoint
          'https://mercury.landmarkglobal.com/api/api.php'
        end

        def self.track(tracking_number)
          request = create_document(tracking_number)
          process_request(request)
        end

        def self.track_with_reference(reference_number)
          request = create_document_with_reference(reference_number)
          process_request(request)
        end

        private

        def self.process_request(request)
          response = get_response(request)
          parsed_response = Nokogiri::XML::Document.parse(response)
          if parsed_response.xpath("TrackResponse/Result/Success/text()").to_s != "true"
            raise Error.new(parsed_response)
          else
            Response.new(parsed_response)
          end
        end

        def self.create_document(tracking_number)
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.TrackRequest {
              xml.Login {
                xml.Username Landmark.username || ENV["LANDMARK_USERNAME"]
                xml.Password Landmark.password || ENV["LANDMARK_PASSWORD"]
              }

              if Landmark.test_mode
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
                xml.Username Landmark.username || ENV["LANDMARK_USERNAME"]
                xml.Password Landmark.password || ENV["LANDMARK_PASSWORD"]
              }

              if Landmark.test_mode
                xml.Test "true"
              end
              xml.RetrievalType "HISTORICAL" # required for all event data
              xml.ClientID Landmark.client_id || ENV["LANDMARK_CLIENT_ID"]
              xml.Reference reference_number

            }
          end

          builder
        end

        def self.get_response(request)
          if Omniship.debug
            puts endpoint
            puts request.to_xml
          end
          response = RestClient.post endpoint, request.to_xml, content_type: "text/xml", accept: "text/xml"
          
          if Omniship.debug
            puts response
          end
          response
        end
      end
    end
  end
end
