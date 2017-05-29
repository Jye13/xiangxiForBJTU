class CategoryController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def edit
    @category = Category.find(params[:category_id])
    if params[:logo]
      uploaded_io = params[:logo]
      Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
      @logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
      if @category.update_attributes(:name => params[:name], :logo => @logo)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      if @category.update_attributes(:name => params[:name])
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  def list
    if params[:query]
      @categories = Category.where(:is_delete => 0).ransack(:name_cont => params[:query])
    else
      @categories = Category.where(:is_delete => 0)
    end
    if @categories
      render :json => {:status => 0, :msg => 'success', :data => {:categories => @categories}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stopCategory
    @count = Category.find(params[:category_id]).products.count
    @category = Category.find(params[:category_id])
    if @category
      if @count > 0
        render :json => {:status => 1, :msg => '该品类下还有商品，不能删除'}
      else
        @category.update_attributes(:is_delete => 1)
        render :json => {:status => 0, :msg => 'success'}
      end
    else
      render :json => {:status => 1, :msg => '该品类不存在'}
    end
  end

  def addCategory
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
end
