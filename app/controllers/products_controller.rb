require 'csv'
class ProductsController < ApplicationController
	before_filter :authenticate_user!, :except => [:index, :show]
  
  def index
    @products = Product.all
		@product = Product.new
  end

  def show
    @product = Product.find(params[:id])
    
  end
  
  def new
    @product = Product.new
  end

  def create
    @product = Product.new(params[:product])
    if @product.valid? 
      @product.save
      redirect_to products_path, notice: 'Employee was successfully created.'
    else
      redirect_to action: "index"    
    end
  end
    
end
