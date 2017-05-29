class PriceController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def addPrice
    @product = Product.find(params[:product_id])
    @price = Price.new(:price => params[:price], :product => @product)
    if @price.save
      @product.update_attributes(:price => params[:price])
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showPrice
    @prices = Price.find_by_product_id(params[:product_id])
    if @prices
      render :json => {:status => 0, :msg => 'success', :data => {:prices => @prices}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def changePrice
    @price = Price.find(params[:price_id])
    @product = Product.find(params[:product_id])
    if @price && @product
      @product.update_attributes(:price => @price.price)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
