require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poser::InventoryUpload do
  before(:each) do
    @fixture = raw_fixture('Mac_UploadInventory.txt')
    @upload = Poser::InventoryUpload.new(@fixture, true)
  end

  describe "#updated_products" do
    it "should read in all the products that need updating" do
      @upload.updated_products.should_not be_empty
      @upload.updated_products.first.id.should == '1015'
    end
  end

  describe "#deleted_products" do
    it "should have all the item IDs that need deletion" do
      @upload.deleted_products.should_not be_empty
      ['4101', '4195', '4196'].each do |id|
        @upload.deleted_products.should include(id)
      end
    end
  end

  describe "#rebuild_inventory?" do
    it "should be true if the second constructor argument is true" do
      @upload.rebuild_inventory?.should be_true
    end
  end
end
