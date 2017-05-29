class CategoryController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    @category = Category.new
    @category.name = params[:name]
    uploaded_io = params[:logo]
    @category.logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
    #上传到七牛
    Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
    if @category.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showCategories
    @merchant = Merchant.find(params[:merchant_id])
    @categories = @merchant.categories.where(:is_delete => 0)
    if @categories
      render :json => {:status => 0, :msg => 'success', :categories => @categories}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def deleteCategory
    @category = Category.find(params[:category_id])
    if @category.update_attributes!(:is_delete => 1)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAllCategories
    @categories = Category.all
    if @categories
      render :json => {:status => 0, :msg => 'success', :data => {:categories => @categories}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  private
  def category_params
    params.permit(:name)
  end
end
