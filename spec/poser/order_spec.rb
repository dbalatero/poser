require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poser::Order do
  before(:each) do
    @order = Poser::Order.new
  end

  describe "#line_items" do
    it "should be empty by default" do
      @order.line_items.should have(0).items
    end

    it "should be able to be added to" do
      @order.line_items << :foo
      @order.line_items.should have(1).item
    end
  end

  describe "#billing_address" do
    it "should be settable" do
      lambda {
        @order.billing_address = Poser::Address.new
      }.should_not raise_error
    end
  end

  describe "#shipping_address" do
    it "should be settable" do
      lambda {
        @order.shipping_address = Poser::Address.new
      }.should_not raise_error
    end
  end

  describe "#department_number" do
    it "should default to 'WEB'" do
      @order.department_number.should == 'WEB'
    end

    it "should be settable" do
      lambda {
        @order.department_number = 'OTHER'
      }.should_not raise_error
    end
  end

  describe "#salesperson_id" do
    it "should default to 'WEB'" do
      @order.salesperson_id.should == 'WEB'
    end

    it "should be settable" do
      lambda {
        @order.salesperson_id = 'OTHER'
      }.should_not raise_error
    end
  end

  describe "#terms" do
    it "should be max 15 chars" do
      @order.terms = "a" * 20
      @order.terms.size.should == 15
    end
  end
  
  describe "#ship_via" do
    it "should always be nil" do
      @order.ship_via.should be_nil
    end
  end

  describe "#taxable?" do
    it "should return a boolean true/false" do
      @order.inventory_taxable = true
      @order.should be_taxable

      @order.inventory_taxable = false
      @order.should_not be_taxable
    end
  end

  describe "#inventory_taxable" do
    it "should return a 'T' if true" do
      @order.inventory_taxable = true
      @order.inventory_taxable.should == 'T'
    end

    it "should return a 'F' if false" do
      @order.inventory_taxable = false
      @order.inventory_taxable.should == 'F'
    end
  end

  describe "#date_with_format" do
    it "should be nil if no date is set" do
      @order.date = nil
      @order.date_with_format.should be_nil
    end

    it "should return in the correct date format" do
      @order.date = Time.mktime(2009, 8, 31, 15, 30, 0)
      @order.date_with_format.should == "08/31/2009 15:30:00"
    end
  end

  describe "#to_csv" do
    it "should dump the correct string out" do
      address = Poser::Address.new(
        :first_name => 'David',
        :middle_initial => 'J',
        :last_name => 'Balatero',
        :address1 => '1234 Fake St',
        :address2 => 'Apt 12',
        :city => 'Seattle',
        :state => 'WA',
        :country => 'USA',
        :postal_code => '98115',
        :phone => '206-123-4567',
        :phone_extension => '1234',
        :email => 'dbalatero@gmail.com'
      )
      @order.shipping_address = address
      @order.billing_address = address
      @order.invoice_id = 'WEB1000'
      @order.customer_id = 'Zumiez'
      @order.customer_purchase_order = '200030'
      @order.date = Time.mktime(2009, 9, 21, 15, 30, 1)
      @order.terms = "My Terms That Are Too Long"
      @order.inventory_taxable = true
      @order.tax_rate1 = 0.089
      @order.tax_method = 0 

      expected = "AddWInv|WEB1000|Zumiez|200030|WEB|WEB|" << # 0-5
                 "09/21/2009 15:30:01|David J Balatero|" << # 6-7
                 "1234 Fake St|Seattle|WA|98115|206-123-4567|" << # 8-12
                 "1234|David J Balatero|1234 Fake St|Seattle|WA|" << # 13-17
                 "98115|206-123-4567|1234|My Terms That A||T|0.089|" << # 18 - 24
                 "||Apt 12|Apt 12|0|0.00|<fill in>|0.00|<fill in>|" << # 25-33
                 "||T||David|J|Balatero|USA|David|J|Balatero|USA|" << # 34-45
                 "||0||||fake@address.com|fake@address.com"
      @order.to_csv.should == expected
    end
  end
end
