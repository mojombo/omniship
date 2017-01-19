module Omniship
  module UPS
    module Track
      class Activity
         
        def initialize(root)
          @root = root
        end

        def address
          Address.new(@root.xpath('ActivityLocation').xpath('Address'))
        end

        def status
          @root.xpath('Status/StatusType/Description').text
        end

        def code 
          @root.xpath('Status/StatusType/Code').text
        end
      end
    end
  end
end
