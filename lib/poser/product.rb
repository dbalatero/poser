module Poser
  class Product
    # See POSIM for more? Don't mind if I do!
    TRANS_CODES = {
      :sale => 'S'.freeze,
      :freight => 'F'.freeze,
      :comment => 'C'.freeze
    }

    def initialize(product_csv_row)
      @fields = product_csv_row.strip.split(/\|/)
    end

    def id
      @fields[1]
    end

    def description
      @fields[2]
    end

    def manufacturer
      @fields[3]
    end

    def manufacturer_number
      @fields[4]
    end

    def suggested_price
      @fields[5].to_f
    end

    def price
      @fields[6].to_f
    end
    
    def average_price
      @fields[7].to_f
    end

    def misc1
      @fields[8]
    end

    def misc2
      @fields[9]
    end

    def misc3
      @fields[10]
    end

    def misc4
      @fields[11]
    end

    def misc5
      @fields[12]
    end

    def available_quantity
      @fields[13].to_i
    end

    def on_order_quantity
      @fields[14].to_i
    end

    def tax_code
      @fields[15]
    end

    def issuage
      @fields[16]
    end

    def track_inventory?
      @fields[17] == 'Y'
    end

    def grid
      @fields[18]
    end

    def grid_row
      @fields[19]
    end

    def grid_column
      @fields[20]
    end

    def location
      @fields[21]
    end

    def committed
      @fields[22].to_i
    end

    def trans_code
      @fields[23]
    end
    
    def web_description
      @fields[24]
    end

    def web_title
      @fields[26]
    end

    def web_out_of_stock_message
      @fields[27]
    end

    def web_price
      @fields[28].to_f
    end

    def vendor_id
      @fields[29]
    end

    def vendor_number
      @fields[30]
    end

    def multi_sites_total_available
      @fields[31].to_i
    end
  end
end
