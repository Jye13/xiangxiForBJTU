class ProductController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
    @categories = Category.all
  end

  def create
    @category = Category.find(params[:category_id])
    @product = Product.new
    @product.name = params[:name]
    @product.price = params[:price]
    uploaded_io = params[:logo]
    @product.logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
    @category.products << @product
    if @product.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAll
    @category = Category.find(params[:category_id])
    if @category
      @products = Product.where(:category_id => @category.id)
      if @products
        render :json => {:status => 0, :msg => 'success', :products => @products}
      else
        render :json => {:status => 2, :msg => "no this product"}
      end
    else
      render :json => {:status => 1, :msg => 'no this category'}
    end
  end

  def deleteProduct
    @category = Category.find(params[:category_id])
    if @category
      @product = @category.products.find(params[:product_id])
      if @product
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 2, :msg => "no this product"}
      end
    else
      render :json => {:status => 1, :msg => 'no this category'}
    end
  end

  def showAllProducts
    @merchant = Merchant.find(params[:merchant_id])
    @products = @merchant.products.where(:is_delete => 0)
    if @products
      arr = []
      @products.each do |product|
        p = Hash.new
        p[:id] = product.id
        p[:name] = product.name
        p[:logo] = product.logo
        @mp = MerchantProductship.where(:merchant_id => params[:merchant_id]).where(:product_id => product.id)
        p[:price] = @mp.first.price
        arr << p
      end
      render :json => {:status => 0, :msg => 'success', :data => {:products => arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showPriceProduct
    @mp = MerchantProductship.where(:merchant_id => params[:merchant_id]).where(:product_id => params[:product_id])
    if @mp.price
      render :json => {:status => 0, :msg => 'success', :data => {:price => @mp.price}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def addPriceProduct
    @mp = MerchantProductship.where(:merchant_id => params[:merchant_id]).where(:product_id => params[:product_id])
    if @mp.update_attributes(:price => params[:price])
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def removePriceProduct
    @mp = MerchantProductship.where(:merchant_id => params[:merchant_id]).where(:product_id => params[:product_id])
    if @mp.update_attributes(:price => nil)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showEveryProducts
    @products = Product.all
    if @products
      render :json => {:status => 0, :msg => "success", :data => {:products => @products}}
    else
      render :json => {:status => 1, :msg => "fail"}
    end
  end

  def showUnProducts
    @products = Product.where(:is_delete => 0)
    @products1 = Merchant.find(params[:merchant_id]).products
    if @products
      @arr = []
      @products.each do |product|
        @flag = 0
        @products1.each do |p|
          if p.id == product.id
            @flag = 1
            break
          end
        end
        if @flag == 0
          @arr << product
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:products => @arr}}
    else
      render :json => {:status => 1, :msg => "fail"}
    end
  end

  def bindMerchantProduct
    @mp = SuggestPriceship.new(:merchant_id => params[:merchant_id], :product_id => params[:product_id], :price => params[:price])
    if @mp.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => "fail"}
    end
  end

  def unbindMerchantProduct
    if params[:merchant_id] && params[:product_id]
      ActiveRecord::Base.connection.execute 'delete from merchant_productships where merchant_id=' + params[:merchant_id] + ' and product_id=' + params[:product_id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => "fail"}
    end
  end
end
