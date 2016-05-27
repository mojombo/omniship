module OmniShip
  module DHLGM
    class TrackRequest
      def self.endpoint
        'https://api.dhlglobalmail.com/api.cfm'
      end

      def self.track(tracking_number)
        request = create_document(tracking_number)
        response = get_response(request)

        parsed_response = Nokogiri::XML::Document.parse(response)

        if parsed_response.xpath("track/error").length > 0
          raise OmniShip::DHLGM::Track::Error.new(parsed_response)
        else
          OmniShip::DHLGM::TrackResponse.new(parsed_response)
        end
      end

      private 

      def self.create_document(tracking_number)
        "#{self.endpoint}?uname=#{DHLGM.username || ENV["DHLGM_USERNAME"]}&pass=#{DHLGM.password || ENV["DHLGM_PASSWORD"]}&trackingnumber=#{tracking_number}"
      end

      def self.get_response(request)
        if OmniShip.debug
          puts request
        end
        response = RestClient.post request, :content_type => "text/xml", :accept => "text/xml"
        
        if OmniShip.debug
          puts endpoint
          puts response
        end
        response
      end
    end
  end
end
