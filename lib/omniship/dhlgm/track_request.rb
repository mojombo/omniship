module OmniShip
  module DHLGM
    class TrackRequest
      def self.endpoint
        'https://api.dhlglobalmail.com/api.cfm'
      end

      def self.track(tracking_number)
        request = create_document(tracking_number)
        response = get_response(request)
        OmniShip::DHLGM::TrackResponse.new(Nokogiri::XML::Document.parse(response))
      end

      private 
        def self.create_document(tracking_number)
          self.endpoint+"?uname=#{DHLGM.username}&pass=#{DHLGM.password}&trackingnumber=#{tracking_number}"
        end

        def self.get_response(request)
          
          if OmniShip.debug
            puts request
          end
          response = RestClient.post request, :content_type => "text/xml", :accept => "text/xml"
          
          if OmniShip.debug
            puts response
          end
          response
        end

    end
  end
end
