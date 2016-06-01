module Omniship
  module Newgistics
    module Track
      class Request

        TEST_URL = 'http://apistaging.newgisticsfulfillment.com'
        LIVE_URL = 'http://api.newgisticsfulfillment.com'

        def self.endpoint
          if Newgistics.test == true 
            TEST_URL
          else
            LIVE_URL
          end
        end

        def self.track(tracking_number)
          request = create_document(tracking_number)
          process_request(request, tracking_number)
        end

        private

        def self.process_request(request, tracking_number)
          response = get_response(request)
          parsed_response = JSON.parse(response)
          package = parsed_response["Packages"].find{|p| p["TrackingNumber"] == tracking_number }

          if error = package["ErrorMessage"] and error.length > 0
            raise Error.new(error)
          else
            Response.new(package)
          end
        end

        def self.create_document(tracking_number, qualifier='barcode')
          {
            merchantID: Newgistics.merchant_id || ENV["NEWGISTICS_MERCHANT_ID"],
            qualifier: qualifier,
            searchStrings: tracking_number
          }
        end

        def self.get_response(request)
          if Omniship.debug
            puts endpoint
            puts request.to_json
          end
          response = RestClient.post endpoint, request.to_json, content_type: "application/json", 'x-API-Key' => Newgistics.api_Key || ENV["NEWGISTICS_API_KEY"]
          
          if Omniship.debug
            puts response
          end
          response
        end
      end
    end
  end
end
