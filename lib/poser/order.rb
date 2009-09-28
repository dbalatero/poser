module Poser
  class Order
    include Poser::Model

    attr_reader :line_items
    attr_accessor :billing_address
    attr_accessor :shipping_address

    attr_accessor :invoice_id
    attr_accessor :customer_id
    attr_accessor :customer_purchase_order
    attr_accessor :department_number
    attr_accessor :salesperson_id
    attr_accessor :date
    attr_accessor :terms

    # Should we charge tax or not?
    attr_accessor :inventory_taxable
    attr_accessor :tax_rate1
    attr_accessor :tax_rate2
    attr_accessor :tax_amount1
    attr_accessor :tax_amount2
    attr_accessor :discount_rate
    attr_accessor :tax_district

    # 0 - pre-defined (tax by rate)
    # 1 - custom tax code (tax by table)
    attr_accessor :tax_method

    # Weird Australian thing
    attr_accessor :tax_included

    # Should discounts be applied on a per-line-item basis?
    attr_accessor :discount_by_line_item

    def initialize(fields = {})
      super(fields)
      @line_items = []
    end

    def discount_by_line_item?
      @discount_by_line_item
    end

    def discount_by_line_item
      discount_by_line_item? ? 'T' : 'F'
    end

    def taxable?
      @inventory_taxable
    end

    def total_tax
      tax_amount1.to_f + tax_amount2.to_f
    end

    def cc_number
      nil
    end

    def cc_expiration
      nil
    end
    
    def register_number
      0
    end

    def inventory_taxable
      taxable? ? 'T' : 'F'
    end

    def user
      nil
    end

    def cc_authorization
      nil
    end

    def web_invoice
      nil
    end

    def department_number
      @department_number || 'WEB'
    end

    def salesperson_id
      @salesperson_id || 'WEB'
    end

    def date_with_format
      date ? date.strftime('%m/%d/%Y %H:%M:%S') : nil
    end

    def terms
      @terms[0..14] rescue nil
    end

    def ship_via
      nil
    end

    def sales_order_id
      nil
    end

    # According to POSIM docs, this field is marked as "?".
    # Therefore... it's nil.
    #
    # ...
    def billing_id
      nil
    end

    def to_csv
      ['AddWInv', invoice_id, customer_id,
       customer_purchase_order, department_number, salesperson_id,
       date_with_format, billing_address.name,
       billing_address.address1, billing_address.city,
       billing_address.state, billing_address.postal_code,
       billing_address.phone, billing_address.phone_extension,
       shipping_address.name, shipping_address.address1,
       shipping_address.city, shipping_address.state,
       shipping_address.postal_code, shipping_address.phone,
       shipping_address.phone_extension, terms, ship_via, # col22
       inventory_taxable, tax_rate1, discount_rate, tax_district, # 26
       billing_address.address2, shipping_address.address2, tax_method,
       tax_rate2, tax_amount1, tax_amount2, total_tax, sales_order_id,
       tax_included, discount_by_line_item, billing_id,
       billing_address.first_name, billing_address.middle_initial,
       billing_address.last_name, billing_address.country,
       shipping_address.first_name, shipping_address.middle_initial,
       shipping_address.last_name, shipping_address.country,
       cc_number, cc_expiration, register_number, user, cc_authorization,
       web_invoice, billing_address.email, shipping_address.email
      ].join('|') 
    end
  end
end
