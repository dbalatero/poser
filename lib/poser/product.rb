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

    # Returns the item ID.
    # This item ID is unique on a per-item basis. In addition,
    # it is unique for each possible combination in a Grid.
    #
    # For example, if you have a single t-shirt with 3 colors
    # and 3 sizes (3x3 = 9 product combinations), each of those 
    # 9 Grid combinations will have a *unique* ID.
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

    # This is what is orderable at the moment.
    def available_quantity
      @fields[13].to_i
    end

    def on_order_quantity
      @fields[14].to_i
    end

    # A value describing the tax code. This can be a custom
    # value, or a standard value.
    #
    # Standard values:
    #   0 - No tax on this item.
    #   1 - Use the state's flat tax rate (i.e. Washington = 8.6%)
    #   2 or higher - A custom tax formula that has been added to POSIM.
    #                 You need the tax formula defined on the Ruby
    #                 side of things as well, to make sure that tax
    #                 is correctly calculated on either side.
    def tax_code
      @fields[15]
    end

    # This says whether a product's quantity is
    #   a) an integer (15 iPods in stock)
    #   b) a float (14.5 feet of rope in stock)
    #
    # Values:
    # Integer = W (whole)
    # Float = F (fractional)
    def issuage
      @fields[16]
    end

    # Convienience method for #issuage.
    def whole_qty?
      issuage == 'W'
    end

    # Convienience method for #issuage.
    def fractional_qty?
      issuage == 'F'
    end

    # This specifies whether POSIM is tracking inventory in stock
    # or not.
    #
    # If true, then whenever a sale is made, the quantity will decrease
    # in stock.
    # If this is false, the quantity in stock will NOT decrease if 
    # an item is sold.
    def track_inventory?
      @fields[17] == 'Y'
    end

    # A unique ID for a group of products.
    #
    # For example, a group of T-Shirts with 3 colors and 3 sizes
    # would all have the same "grid" field to group them together.
    def grid
      @fields[18]
    end

    # The row value for this grid item.
    #
    # This is POSIM-defined. Example:
    #   "Red" (if the 'row' field was being used for Color)
    #   "XXL" (if the 'row' field was being used for Size)
    def grid_row
      @fields[19]
    end

    # The column value for this grid item.
    #
    # This is POSIM-defined. Example:
    #   "Red" (if the 'col' field was being used for Color)
    #   "XXL" (if the 'col' field was being used for Size)
    def grid_column
      @fields[20]
    end

    # This field is a POSIM-defined field describing the product's
    # location (possibly what warehouse it is stored in, for example?)
    #
    # This is just a comment field, and doesn't affect ordering in any
    # way.
    def location
      @fields[21]
    end

    # This field holds the current quantity that is committed to
    # an invoice.
    #
    # If there are 5 on hand, and 1 committed, then 4 are available.
    #
    # Once an invoice is processed, then the product is updated to be:
    #   4 on hand, 0 committed, 4 available.
    def committed
      @fields[22].to_i
    end

    # This is the type of transaction code that is attached to this
    # product. This is usually 'S', for Sale. There are other codes
    # per-situation, however.
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
