require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poser::Address do
  before(:each) do
    @address = Poser::Address.new
  end

  describe "#first_name" do
    it "should be settable" do
      lambda {
        @address.first_name = 'David'
      }.should_not raise_error
    end
  end

  describe "#middle_initial" do
    it "should be settable" do
      lambda {
        @address.middle_initial = 'J'
      }.should_not raise_error
    end
  end

  describe "#last_name" do
    it "should be settable" do
      lambda {
        @address.last_name = 'Balatero'
      }.should_not raise_error
    end
  end

  describe "#name" do
    it "should return the full name of the person on the address" do
      @address.first_name = 'David'
      @address.middle_initial = nil
      @address.last_name = 'Balatero'

      @address.name.should == 'David Balatero'
    end
  end

  describe "#address1" do
    it "should be settable" do
      lambda {
        @address.address1 = '1234 Fake Street'
      }.should_not raise_error
    end
  end

  describe "#address2" do
    it "should be settable" do
      lambda {
        @address.address2 = 'Apt #24'
      }.should_not raise_error
    end
  end

  describe "#city" do
    it "should be settable" do
      lambda {
        @address.city = 'Seattle'
      }.should_not raise_error
    end
  end

  describe "#state" do
    it "should be settable" do
      lambda {
        @address.state = 'WA'
      }.should_not raise_error
    end
  end

  describe "#postal_code" do
    it "should be settable" do
      lambda {
        @address.postal_code = '98115'
      }.should_not raise_error
    end
  end

  describe "#phone" do
    it "should be settable" do
      lambda {
        @address.phone = '206-123-3498'
      }.should_not raise_error
    end
  end

  describe "#phone_extension" do
    it "should be settable" do
      lambda {
        @address.phone_extension = '1234'
      }.should_not raise_error
    end
  end
  
  describe "#country" do
    it "should be settable" do
      lambda {
        @address.country = 'US'
      }.should_not raise_error
    end
  end

  describe "#email" do
    it "should be settable" do
      lambda {
        @address.email = 'dbalatero@gmail.com'
      }.should_not raise_error
    end
  end
end
