require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poser::LineItem do
  before(:each) do
    @line_item = Poser::LineItem.new
  end

  describe "a valid line item" do
    it "should not have errors"
  end

  describe "#valid?" do
    it "should require the invoice ID" do
      pending
      @line_item.should_not be_valid
      @line_item.errors['invoice_id'].should_not be_nil
    end
  end

  describe "#invoice_id" do
    it "should be assignable" do
      lambda { 
        @line_item.invoice_id = "WEB1000"
      }.should_not raise_error
    end
  end

  describe "#trans_code" do
    it "should be assignable" do
      lambda {
        @line_item.trans_code = 'S'
      }.should_not raise_error
    end
  end

  describe "#qty_ordered" do
    it "should be assignable" do
      lambda {
        @line_item.qty_ordered = 50
      }.should_not raise_error
    end
  end

  describe "#product_id" do
    it "should be assignable" do
      lambda {
        @line_item.product_id = "SKU49902"
      }.should_not raise_error
    end
  end

  describe "#description" do
    it "should be assignable" do
      lambda {
        @line_item.description = "T-Shirt"
      }.should_not raise_error
    end

    it "should be nil if not set" do
      @line_item.description.should be_nil
    end

    it "should be maximum 30 characters" do
      @line_item.description = "t" * 50
      @line_item.description.size.should == 30
    end
  end

  describe "#pricing_level" do
    it "should default to 0" do
      @line_item.pricing_level.should == 0
    end

    it "should be assignable" do
      @line_item.pricing_level = 7
      @line_item.pricing_level.should == 7
    end
  end

  describe "#unit_price" do
    it "should be assignable" do
      lambda {
        @line_item.unit_price = 5.99
      }.should_not raise_error
    end
  end

  describe "#subtotal" do
    it "should be equal to price * qty" do
      @line_item.unit_price = 5.00
      @line_item.qty_ordered = 5
      @line_item.subtotal.should == 25.00
    end
  end

  describe "#tax_code" do
    it "should be assignable" do
      lambda {
        @line_item.tax_code = 0
      }.should_not raise_error
    end
  end

  describe "#tax_inc" do
    it "should always default to nil" do
      @line_item.tax_inc.should be_nil
    end

    it "should be assignable" do
      lambda {
        @line_item.tax_inc = 4.00
      }.should_not raise_error
    end
  end

  describe "#cost" do
    it "should not be assignable" do
      lambda {
        @line_item.cost = 5.00
      }.should raise_error
    end

    it "should always be nil" do
      @line_item.cost.should be_nil
    end
  end

  describe "#on_hand" do
    it "should not be assignable" do
      lambda {
        @line_item.on_hand = 5
      }.should raise_error
    end

    it "should always be nil" do
      @line_item.on_hand.should be_nil
    end
  end

  describe "#gift_card_id" do
    it "should default to nil" do
      @line_item.gift_card_id.should be_nil
    end

    it "should be assignable" do
      lambda {
        @line_item.gift_card_id = "SOMEID"
      }.should_not raise_error
    end
  end

  describe "#retail_price" do
    it "should default to nil" do
      @line_item.retail_price.should be_nil
    end

    it "should be assignable" do
      lambda {
        @line_item.retail_price = 5.00
      }.should_not raise_error
    end
  end

  describe "#to_csv" do
    it "should dump out the line item correctly" do
      expected = "AddOneWInvLine|WEB1000||S|10|SKU482|" <<
                 "My Line Item|0|3.00|30.00|1|||||5.00|\r"
      @line_item = Poser::LineItem.new(
        :invoice_id => 'WEB1000',
        :trans_code => 'S',
        :qty_ordered => 10,
        :product_id => 'SKU482',
        :description => 'My Line Item',
        :unit_price => 3.00,
        :tax_code => 1,
        :retail_price => 5.00
      )

      @line_item.to_csv.should == expected
    end
  end
end
