require 'spec_helper'

describe ProductsController do

	before (:each) do
  		@user = FactoryGirl.create(:user)
  		sign_in @user	
	end

  describe "GET index" do
    it "should catch index page with get verbs" do
    	get :index
    	response.should be_success	
    end
    
  end
  
  describe "GET 'new' product page" do
    it "should load new product creation page" do
      get :new
    end
    
    it "should to load new product object" do
      get :new
      assigns[:product].should_not be_nil
      assigns[:product].should be_kind_of(Product)
      assigns[:product].should be_new_record
    end 
  end

  describe "GET show" do
    before do
      @product = FactoryGirl.create(:product)
      get :show, :id => @product.id
    end
    
    it "should load right @product" do
      get :show, :id =>@product.id
      assigns[:product].should == @product
    end
    
    it "should redirect to 'show' page " do
      get :show, :id =>@product.id
      response.should render_template('show')
    end
  end

  describe "POST create" do
    	before do
        @product_params = {"product"=>{"name"=>"testing",
           "description"=>"desc",
           "price"=>"1"}
         }
      end
      it "should redirect to 'index' page" do
        @product_params.stub!(:save).and_return(true)
        post :create, :product => @product_params
        response.should redirect_to(@products_path)
      end
      it "should assign a @product variable" do
        post :create, @product_params
        assigns[:product].should_not be_nil
        assigns[:product].should be_kind_of(Product)
      end
  end
  
end
