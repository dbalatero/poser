require File.expand_path(File.dirname(__FILE__) + '/spec_helper')

describe Poser do
  describe "#username" do
    it "should be settable/gettable" do
      Poser.username = 'dbalatero'
      Poser.username.should == 'dbalatero'
    end
  end

  describe "#password" do
    it "should be settable/gettable" do
      Poser.password = 'testpw'
      Poser.password.should == 'testpw'
    end
  end

  describe "#authenticates?" do
    before(:each) do
      Poser.username = 'dbalatero'
      Poser.password = 'testpw'
    end

    it "should return true if the credentials match" do
      Poser.authenticates?('dbalatero', 'testpw').should be_true
    end

    it "should return false if the username doesn't match" do
      Poser.authenticates?('dbalatero2', 'testpw').should be_false
    end

    it "should return false if the password doesn't match" do
      Poser.authenticates?('dbalatero', 'badpw').should be_false
    end

    it "should return false if neither user or password matches" do
      Poser.authenticates?('swing', 'andamiss').should be_false
    end
  end
end
