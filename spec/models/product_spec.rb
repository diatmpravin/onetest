require 'spec_helper'

describe Product do
  describe "validation" do
  	it "should have unique a name" do
  	  product = FactoryGirl.create(:product, :name => 'test')
  		product = Product.create(:price => "test")
  		product.should_not be_valid
  	end
  	
  	it "should not be valid without a price" do
  		product = Product.create(:price => "")
  		product.should_not be_valid
  	end
  	
  	it "should not be valid without a description" do
  		product = Product.create(:description => "")
  		product.valid?.should == false
  	end
  end
  
end
