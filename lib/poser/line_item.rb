module Poser
  class LineItem
    include Poser::Model

    # The trans code for this line item. Possible values:
    # S - Sale 
    # F - Freight and Handling 
    # C - Comment 
    # N - Non-printable comment 
    # R - Return an Item 
    # M - Misc Charge/Discount 
    # L - Labor 
    # P - Payment On Account 
    # D - Deposit 
    # T - Transfer 
    # B - Backorder 
    # G - Gift Card 
    # O - Paiaffdsafdsa Out 
    # A - Cash Advance 
    # + - Cash Draw 
    # - - Cash Drop 
    # E - Backorder Freight 
    attr_accessor :trans_code

    # Holds the invoice ID that this line item is part of.
    attr_accessor :invoice_id

    # Holds the POSIM product ID that this line item relates to.
    attr_accessor :product_id

    # A 30-character description that shows on the line item. 
    attr_accessor :description

    # The quantity that was ordered.
    attr_accessor :qty_ordered

    # The pricing level. Can be between 0 and 7, defaults
    # to zero. If you don't know what this (I don't really know),
    # then leave it alone.
    attr_accessor :pricing_level

    # How much to charge per product on this line item.
    attr_accessor :unit_price

    # Tax code attached to this item.
    # Use whatever tax_code came in when you got the Product
    # update from POSIM.
    #
    # See Poser::Product#tax_code for potential values.
    # In the simple case, you'll want to use 0 (no tax)
    # or 1 (flat tax by state)
    attr_accessor :tax_code

    # Australian value. You (or I) should never need this. Unless 
    # you're Australian.
    attr_accessor :tax_inc

    # If a gift card is being sold, add the gift card ID here.
    attr_accessor :gift_card_id

    # If you want "Our Retail" to show up on the invoice, fill
    # this field in.
    attr_accessor :retail_price

    # Restricted to 30 characters.
    def description
      @description[0..29] rescue nil
    end

    # This is qty_ordered * unit_price.
    def subtotal
      qty_ordered * unit_price
    end

    def pricing_level
      @pricing_level || 0
    end

    # Always nil for our purposes. POSIM fills this in later,
    # but your client should never see it, so don't worry about it.
    def cost
      nil
    end

    # Always nil for our purposes. POSIM fills this in later,
    # but your client should never see it, so don't worry about it.
    def on_hand
      nil
    end

    # Dumps this LineItem out in the format that POSIM expects to
    # get it in.
    def to_csv
      ['AddOneWInvLine', invoice_id, nil, trans_code, qty_ordered,
       product_id, description, pricing_level, ("%0.2f" % unit_price),
       ("%0.2f" % subtotal), tax_code, tax_inc, cost, on_hand,
       gift_card_id, ("%0.2f" % retail_price), "\r"].join('|')
    end
  end
end
