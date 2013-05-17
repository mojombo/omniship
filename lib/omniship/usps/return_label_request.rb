module OmniShip
  module USPS
    class ReturnLabelRequest
      attr_accessor :window, :service_type, :delivery_confirmation, :insurance_value, :weight, :image_type, :rma, :rma_barcode, :customer, :retailer, :permit, :pdu


      def initialize(customer, retailer, permit, pdu, options = {})
        @window = options[:window]||"RIGHTWINDOW"
        @service_type = options[:service_type]||"Priority"
        @delivery_confirmation = options[:delivery_confirmation] || false
        @insurance_value = options[:insurance_value]
        @weight = options[:weight]
        @image_type = options[:image_type]||"TIF"
        @rma = options[:rma]
        @rma_barcode = options[:rma_barcode] || false

        @customer = customer
        @retailer = retailer
        @permit = permit 
        @pdu = pdu
      end

      def self.endpoint
        'https://secure.shippingapis.com/ShippingAPI.dll?API=MerchandiseReturnV4&XML='
      end

      def get_response

        request = create_document

        if OmniShip.debug
          puts request.to_xml
        end

        response = RestClient.get URI.encode(self.class.endpoint+request.to_xml.gsub("<?xml version=\"1.0\"?>","")), :content_type => "text/xml", :accept => "text/xml"
        
        if OmniShip.debug
          puts response
        end

        ReturnLabelResponse.new(Nokogiri::XML::Document.parse(response), {:image_type => @image_type})
      end


      private 
        def create_document
          builder = Nokogiri::XML::Builder.new do |xml|
            xml.send(:"EMRSV4.0Request", :USERID=>USPS.userid, :PASSWORD=>USPS.password){
              xml.Option @window
              @customer.to_xml(xml)
              @retailer.to_xml(xml)
              @permit.to_xml(xml)
              @pdu.to_xml(xml)

              xml.ServiceType @service_type
              if @delivery_confirmation
                xml.DeliveryConfirmation "True"
              else
                xml.DeliveryConfirmation "False"
              end
              xml.InsuranceValue @insurance_value
              xml.MailingAckPackageID ""
              xml.WeightInPounds 0
              xml.WeightInOunces @weight
              xml.RMA @rma
              xml.RMAPICFlag "False"
              xml.ImageType @image_type
              if @rma_barcode
                xml.RMABarcode "True"
              else
                xml.RMABarcode "False"
              end
              xml.AllowNonCleansedDestAddr "False"
              xml.AllowNonCleansedCustAddr "True"

            }
          end

          builder
        end
    end
  end
end
