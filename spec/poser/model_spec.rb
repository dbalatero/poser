require File.expand_path(File.dirname(__FILE__) + '/../spec_helper')

describe Poser::Model do
  it "should allow hash assignment of model attributes" do
    class A
      attr_accessor :a, :b, :c
      include Poser::Model
    end

    model = A.new(:a => 'test',
                  :b => :foo,
                  :c => 'ok')
    model.a.should == 'test'
    model.b.should == :foo
    model.c.should == 'ok'
  end
end
