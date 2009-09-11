module Poser
  class InventoryUpload
    attr_reader :updated_products, :deleted_products

    def initialize(data_file, rebuild_inventory)
      @rebuild_inventory = rebuild_inventory
      @updated_products = []
      @deleted_products = []

      data_file.split(/[\r\n]+/).each do |line|
        if line =~ /^AddOrUpdateItem2/
          @updated_products << Product.new(line)
        elsif line =~ /^DeleteWebItem\|(.*)/
          @deleted_products << $1
        end
      end
    end

    def rebuild_inventory?
      @rebuild_inventory
    end
  end
end
