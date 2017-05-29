class CouponController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    if params[:name] && params[:from] && params[:to] && params[:price] && params[:discount]
      @coupon = Coupon.new(:name => params[:name], :from => params[:from], :to => params[:to], :price => params[:price], :discount => params[:discount])
      if @coupon.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '保存不成功'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def show
    @coupons = Coupon.where(:is_del => 0)
    if @coupons
      render :json => {:status => 0, :msg => 'success', :data => {:coupons => @coupons}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def notUserCoupon
    if params[:user_id]
      @ucs = User.find(params[:user_id]).coupons.where(:is_del => 0)
      @arr = []
      @uas = Coupon.all
      @uas.each do |ua|
        flag = 0
        @ucs.each do |uc|
          if uc.id == ua.id
            flag = 1
            break
          end
        end
        if flag == 0
          @arr << ua
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:coupons => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def catch
    if params[:user_id] && params[:coupon_id]
      @uc = UserCouponship.new
      @uc.user = User.find(params[:user_id])
      @uc.coupon = Coupon.find(params[:coupon_id])
      if @uc.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '创建失败'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def userCoupon
    if params[:user_id]
      @ucs = User.find(params[:user_id]).coupons.where(:is_del => 0)
      render :json => {:status => 0, :msg => 'success', :data => {:coupons => @ucs}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def userDelete
    if params[:user_id] && params[:coupon_id]
      ActiveRecord::Base.connection.execute 'delete from user_couponships where user_id=' + params[:user_id] + ' and coupon_id= ' + params[:coupon_id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def del
    if params[:id]
      ActiveRecord::Base.connection.execute 'delete from coupons where id=' + params[:id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => '参数问题'}
    end
  end

  def pushAllUser
    if params[:id]
      @users = User.where(:is_del => 0)
      @users.each do |user|
        @uc = UserCouponship.new
        @uc.user = User.find(user.id)
        @uc.coupon = Coupon.find(params[:id])
        @uc.save
      end
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => '参数问题'}
    end
  end

end
