class ProductController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def edit
    @product = Product.find(params[:product_id])
    if params[:logo]
      uploaded_io = params[:logo]
      Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
      @logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
      if @product.update_attributes(:name => params[:name], :logo => @logo)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      if @product.update_attributes(:name => params[:name])
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  def list
    if params[:query]
      @products = Category.find(params[:category_id]).products.where(:is_delete => 0).ransack(:name_cont => params[:query])
    else
      @products = Category.find(params[:category_id]).products.where(:is_delete => 0)
    end
    if @products
      render :json => {:status => 0, :msg => 'success', :data => {:products => @products}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stopProduct
    @product = Product.find(params[:product_id])
    if @product
      if @product.update_attributes(:is_delete => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

    def addProduct
    @category = Category.find(params[:category_id])
    @product = Product.new
    @product.name = params[:name]
    @product.category = @category
    if params[:logo]
      uploaded_io = params[:logo]
      @product.logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
      Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
      @category.products << @product
      if @product.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      @product.logo = 'xxxxxxx'
      if @product.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  def showProductPrice
    @product = Product.find(params[:product_id])
    @ps = MerchantProductship.where(:product_id => params[:product_id])
    @count = 0
    @num = 0
    @ps.each do |p|
      @count = @count + p.price
      @num = @num + 1
    end
    if @count != 0
      @count = @count/@num
      render :json => {:status => 0, :msg => 'success', :data => {:count => @count, :product => @product}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def addProductPrice
    if params[:price1] && params[:price2] && params[:price3] && params[:price4] && params[:price5] && params[:price6]
      @product = Product.find(params[:product_id])
      @product.update_attributes(:price1 => params[:price1])
      @product.update_attributes(:price2 => params[:price2])
      @product.update_attributes(:price3 => params[:price3])
      @product.update_attributes(:price4 => params[:price4])
      @product.update_attributes(:price5 => params[:price5])
      @product.update_attributes(:price6 => params[:price6])
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

end
