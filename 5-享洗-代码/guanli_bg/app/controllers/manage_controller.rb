class ManageController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def manageMerchant
    @merchants = Merchant.all
    if @merchants
      render :json => {:status => 0, :msg => 'success', :merchants => @merchants}
    else
      render :json => {:status => 1, :msg =>'fail'}
    end
  end

  def stopMerchant
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant
      if @merchant.update_attributes(:is_delete => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this merchant'}
    end
  end

  def activeMerchant
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant
      if @merchant.update_attributes(:is_delete => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this merchant'}
    end
  end

  def manageRider
    @riders = Rider.all
    if @riders
      render :json => {:status => 0, :msg => 'success', :riders => @riders}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stopRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      if @rider.update_attribute(:is_del,1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this rider'}
    end
  end

  def activeRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      if @rider.update_attribute(:is_del,0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 2, :msg => 'not this rider'}
    end
  end

  def manageUser
    @users = User.all
    if @users
      render :json => {:status => 0, :msg => 'success', :users => @users}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showSuggestPrice
    @sp = SuggestPriceship.all
    if @sp
      render :json => {:status => 0, :msg => 'success', :data => {:suggest => @sp}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def manageSuggestPrice
    if params[:id] && params[:price]
      @sp = SuggestPriceship.find(params[:id])
      @mp = MerchantProductship.new
      @mp.merchant_id = @sp.merchant_id
      @mp.product_id = @sp.merchant_id
      @mp.price = params[:price]
      if @mp.save
        ActiveRecord::Base.connection.execute 'delete from suggest_priceships where id=' + params[:id]
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '保存失败'}
      end
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end
end
