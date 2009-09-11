require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poser::Product do
  PRODUCT_ROW = "AddOrUpdateItem2|1015|Intermediate Accounting-3rd Ed|JONES|1234|32.950000|24.720000|24.720000|1234567885|Book|Accounting|Welsch, Zl|A-1|15.000000|0.000000|1|W|Y|Style|Row|Col|Loc|0.000000|S|Our most popular book. Will make accounting come alive, exciting and thriling.  You will want to read it every night before you go to bed.||Intermediate Accounting-3rd Ed|This book is in great demand, shippment when available.|32.95|Johnny|AB1015|0.000000"

  before(:each) do
    @product = Poser::Product.new(PRODUCT_ROW)
  end

  describe "#id" do
    it "should return the item ID" do
      @product.id.should == '1015'
    end
  end

  describe "#description" do
    it "should return the description" do
      @product.description.should == 'Intermediate Accounting-3rd Ed'
    end
  end

  describe "#manufacturer" do
    it "should return the manufacturer" do
      @product.manufacturer.should == 'JONES'
    end
  end

  describe "#manufacturer_number" do
    it "should return the manufacturer's number for the product" do
      @product.manufacturer_number.should == '1234'
    end
  end

  describe "#suggested_price" do
    it "should return suggested retail price" do
      @product.suggested_price.should == 32.95
    end
  end

  describe "#price" do
    it "should return our price" do
      @product.price.should == 24.72
    end
  end

  describe "#average_price" do
    it "should return the average retail price" do
      @product.average_price.should == 24.72
    end
  end

  # WTF.
  describe "#misc1" do
    it "should return the misc1 field" do
      @product.misc1.should == '1234567885'
    end
  end

  describe "#misc2" do
    it "should return the misc2 field" do
      @product.misc2.should == 'Book'
    end
  end

  describe "#misc3" do
    it "should return the misc3 field" do
      @product.misc3.should == 'Accounting'
    end
  end

  describe "#misc4" do
    it "should return the misc4 field" do
      @product.misc4.should == 'Welsch, Zl'
    end
  end

  describe "#misc5" do
    it "should return the misc5 field" do
      @product.misc5.should == 'A-1'
    end
  end

  describe "#available_quantity" do
    it "should return the number available, AS INTEGERS, you fuckers" do
      @product.available_quantity.should == 15
    end
  end

  describe "#on_order_quantity" do
    it "should return the number that are on order, AS INTEGERS, you fuckers" do
      @product.on_order_quantity.should == 0
    end
  end

  describe "#tax_code" do
    it "should be clear what the fuck this does"
    it "should return the tax code" do
      @product.tax_code.should == '1'
    end
  end

  describe "#issuage" do
    it "should be clear what the fuck this does"
    it "should return the issuage field" do
      @product.issuage.should == 'W'
    end
  end

  describe "#track_inventory?" do
    it "should be clear what the fuck this does"
    it "should return true/false depending on the value being Y/N" do
      @product.track_inventory?.should be_true
    end
  end

  describe "#grid" do
    it "should be clear how the grid is used"
    it "should return the grid identifier" do
      @product.grid.should == 'Style'
    end
  end

  describe "#grid_row" do
    it "should return the grid row" do
      @product.grid_row.should == 'Row'
    end
  end

  describe "#grid_column" do
    it "should return the grid column" do
      @product.grid_column.should == 'Col'
    end
  end

  describe "#location" do
    it "should be clear what the fuck this does"
    it "should return the location field" do
      @product.location.should == 'Loc'
    end
  end

  describe "#committed" do
    it "should be clear what the fuck this does"
    it "should be determined if this should be an integer"
    it "should return the committed field, as an INTEGER" do
      @product.committed.should == 0
    end
  end

  describe "#trans_code" do
    it "should return the correct trans code" do
      @product.trans_code.should == Poser::Product::TRANS_CODES[:sale]
    end
  end

  describe "#web_description" do
    it "should return the web description" do
      @product.web_description.should == "Our most popular book. Will make accounting come alive, exciting and thriling.  You will want to read it every night before you go to bed."
    end
  end

  describe "#web_title" do
    it "should return the correct web title" do
      @product.web_title.should == 'Intermediate Accounting-3rd Ed'
    end
  end

  describe "#web_out_of_stock_message" do
    it "should return the out of stock message" do
      @product.web_out_of_stock_message.should == 'This book is in great demand, shippment when available.'
    end
  end

  describe "#web_price" do
    it "should return the web price" do
      @product.web_price.should == 32.95
    end
  end

  describe "#vendor_id" do
    it "should have the correct vendor ID" do
      @product.vendor_id.should == 'Johnny'
    end
  end

  describe "#vendor_number" do
    it "should have the correct vendor number" do
      @product.vendor_number.should == 'AB1015'
    end
  end

  describe "#multi_sites_total_available" do
    it "should return the total available for multi-sites" do
      @product.multi_sites_total_available.should == 0
    end
  end
end
