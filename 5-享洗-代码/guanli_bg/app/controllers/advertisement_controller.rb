class AdvertisementController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def addAd
    if params[:product_id] && params[:logo] && params[:name]
      @ad = Advertisement.new
      uploaded_io = params[:logo]
      Image.upload(params[:logo].tempfile.path, uploaded_io.original_filename)
      @ad.ad_logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename
      @ad.product_id = params[:product_id]
      @ad.product_name = Product.find(params[:product_id]).name
      @ad.name = params[:name]
      if @ad.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '保存失败'}
      end
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

  def allProduct
    @p = Product.where(:is_delete => 0)
    if @p
      render :json => {:status => 0, :msg => 'success', :data => {:product => @p}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def push
    if params[:user_id]
      @total = []
      @ps = Order.find_by_sql("select product_id from orders where user_id=#{params[:user_id]} group by product_id order by count(product_id) desc;")
      if @ps.count < 3 && @ps.count > 0
        @vis = []
        flag = 0
        @ps.each do |p|
          @ad = Product.find(p.product_id).advertisements.first
          @total << @ad
          @vis[@ad.id] = 1
          flag = flag + 1
        end
        @adver = Advertisement.all
        @adver.each do |adver|
          if @vis[adver.id] == 1
            next
          end
          @vis[adver.id] = 1
          @total << adver
          flag = flag + 1
          if flag >= 3
            break
          end
        end
      elsif @ps.count == 0
        @ads = Advertisement.limit(3)
        @ads.each do |ad|
          @total << ad
        end
      else
        @ps.each do |p|
          @ad = Product.find(p.product_id).advertisements.first
          @total << @ad
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:ad => @total}}
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

    def adList
    if params[:product_id]
      if params[:product_id].to_i == 0
        @ads = Advertisement.all
      else
        @ads = Advertisement.where(:product => params[:product_id])
      end
      render :json => {:status => 0, :msg => 'success', :data => {:ad => @ads}}
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

    def delAd
    if params[:id]
      ActiveRecord::Base.connection.execute 'delete from advertisements where id=' + params[:id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

end
