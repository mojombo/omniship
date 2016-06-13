module Omniship
  module DHLGM
    module Track
      class Request
        def self.endpoint
          'https://api.dhlglobalmail.com/api.cfm'
        end

        def self.track(tracking_number)
          request = create_document(tracking_number)
          response = get_response(request)

          parsed_response = Nokogiri::XML::Document.parse(response)

          if parsed_response.xpath("track/error").length > 0
            raise Error.new(parsed_response)
          else
            Response.new(parsed_response)
          end
        end

        private 

        def self.create_document(tracking_number)
          "#{self.endpoint}?uname=#{DHLGM.username || ENV["DHLGM_USERNAME"]}&pass=#{DHLGM.password || ENV["DHLGM_PASSWORD"]}&trackingnumber=#{tracking_number}"
        end

        def self.get_response(request)
          if Omniship.debug
            puts request
          end
          response = RestClient.post request, content_type: "text/xml", accept: "text/xml"
          
          if Omniship.debug
            puts endpoint
            puts response
          end
          response
        end
      end
    end
  end
end