module Poser
  class LineItem
    include Poser::Model

    attr_accessor :trans_code
    attr_accessor :invoice_id
    attr_accessor :product_id
    attr_accessor :description
    attr_accessor :qty_ordered
    attr_accessor :pricing_level 
    attr_accessor :unit_price
    attr_accessor :tax_code
    attr_accessor :tax_inc
    attr_accessor :gift_card_id
    attr_accessor :retail_price

    def subtotal
      qty_ordered * unit_price
    end

    def pricing_level
      @pricing_level || 0
    end

    def cost
      nil
    end

    def on_hand
      nil
    end

    def to_csv
      ['AddOneWInvLine', invoice_id, nil, trans_code, qty_ordered,
       product_id, description, pricing_level, ("%0.2f" % unit_price),
       ("%0.2f" % subtotal), tax_code, tax_inc, cost, on_hand,
       gift_card_id, ("%0.2f" % retail_price)].join('|')
    end
  end
end
