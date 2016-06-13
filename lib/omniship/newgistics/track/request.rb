module Omniship
  module Newgistics
    module Track
      class Request
        # https://apiint.newgistics.com/WebAPI/Shipment/help/operations/Tracking
        
        TEST_URL = 'https://apiint.newgistics.com/WebAPI/Shipment/Tracking'
        LIVE_URL = 'https://api.newgisticsfulfillment.com'

        def self.endpoint
          if Newgistics.test == true 
            TEST_URL
          else
            LIVE_URL
          end
        end

        def self.track(tracking_number, qualifier)
          request = create_document(tracking_number, qualifier)
          begin 
            response = get_response(request)
            parsed_response = JSON.parse(response)
            package = parsed_response["Packages"].find{|p| p["TrackingNumber"] == tracking_number }

            return Response.new(parsed_response) unless error = package["ErrorMessage"] and error.length > 0
          rescue  => e 
            puts e.response.inspect if Omniship.debug
            error = "No tracking found."
          end

          raise Error.new(error)
        end

        private


        def self.create_document(tracking_number, qualifier)
          {
            merchantID: Newgistics.merchant_id || ENV["NEWGISTICS_MERCHANT_ID"],
            qualifier: qualifier,
            searchStrings: [tracking_number]
          }
        end

        def self.get_response(request)
          if Omniship.debug
            puts endpoint
            puts request.to_json
          end
          response = RestClient.post endpoint, request.to_json, content_type: :json, accept: :json,'x-API-Key' => Newgistics.api_key || ENV["NEWGISTICS_API_KEY"]
          if Omniship.debug
            puts response
          end
          response
        end
      end
    end
  end
end
