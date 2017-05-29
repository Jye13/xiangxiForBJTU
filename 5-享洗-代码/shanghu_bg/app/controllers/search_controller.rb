class SearchController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def findProducts
    @result = Product.ransack(:name_cont => params[:query])
    @products = @result.result(distinct: true)
    if @products
      render :json => {:status => 0, :msg => 'success', :data => {:products => @products}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def addUserRedis
    if params[:user_id] == null || params[:merchant_id] == null
      render :json => {:status => 1, :msg => 'fail'}
    else
      $redis.sadd('merchant_#{params[:merchant_id]}', params[:user_id])
      render :json => {:status => 0, :msg => 'success'}
    end
  end

  def showUserRedis
    if params[:merchant_id] == null
      render :json => {:status => 1, :msg => 'fail'}
    else
      @userIdList = Array.new($redis.smembers('merchant_#{params[:merchant_id]}'))
      @userList = Array.new
      @userIdList.each do |userId|
        @user = User.find(userId)
        @userList << @user
      end
      render :json => {:status => 0, :msg => 'success', :data => {:userList => @userList}}
    end
  end
end
