module Omniship
  module USPS
    class ReturnLabelResponse
      attr_accessor :label, :root, :image_type, :tracking_number

      def initialize(root, options={})
        @root = root

        @image_type = options[:image_type]||"TIF"

        error = root.xpath("Error")
        if !error.empty?
          raise StandardError, "#{error.xpath("Number/text()")}: #{error.xpath("Description/text()")}"
        end
        @label = @root.xpath("EMRSV4.0Response/MerchandiseReturnLabel/text()").to_s  
        @tracking_number = @root.xpath("EMRSV4.0Response/MerchandiseReturnNumber/text()").to_s        
      end

      def save(file_name)
        if @label.nil? or @label.empty?
          raise StandardError, "Label is invalid" 
        end

        File.open("#{file_name}.#{@image_type.downcase}", 'wb') do|f|
          f.write(Base64.decode64(@label))
        end
      end
    end
  end
end