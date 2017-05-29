class OrderController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def getAllOrder
    if params[:merchant_id]
      @arr = []
      @products = Merchant.find(params[:merchant_id]).products
      @stations = Merchant.find(params[:merchant_id]).stations
      @stations.each do |station|
        @odr = Orderstation.where(:station_id => station.id)
        @odr.each do |od|
          @order = Order.find(od.order_id)
          if @order.is_del == 0 && @order.status == 4
            @flag = 0
            @products.each do |product|
              if product.id == @order.product_id.to_i
                @flag = 1
                break
              end
            end
            if @flag == 1
              @arr << @order
            end
          end
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:orders => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end


  def catchOrder
    if params[:order_id] && params[:merchant_id]
      @order = Order.find(params[:order_id])
      @merchant = Merchant.find(params[:merchant_id])
      if @order.update_attribute(:status, 5) && MerchantOrdership.create(:order => @order, :merchant => @merchant)
        @mp = MerchantProductship.where(:merchant_id => params[:merchant_id]).where(:product_id => @order.product_id).first
        @order.update_attribute(:merchant_price, @mp.price * @order.product_nums)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail to update'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def myOrder
    if params[:merchant_id]
      @merchant = Merchant.find(params[:merchant_id])
      @orders = @merchant.orders
      arr = []
      @orders.each do |order|
        @mo = MerchantOrdership.where(:order => order).where(:merchant => @merchant).last
        if @mo.is_del == 0
          arr << order
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:orders => arr}}
    else
      render :json => {:status => 1, :msg => '参数不对'}
    end
  end

  def washFinsh
    if params[:order_id] && params[:merchant_id]
      ActiveRecord::Base.connection.execute 'delete from merchant_orderships where merchant_id=' + params[:merchant_id] + ' and order_id=' + params[:order_id]
      @order = Order.find(params[:order_id])
      @order.update_attribute(:status, 7)
      @ml = MerchantLog.new
      @ml.user_id = @order.user_id
      @ml.product_id = @order.product_id
      @ml.money = MerchantProductship.where(:merchant_id => params[:merchant_id]).where(:product_id => @order.product_id).first.price * @order.product_nums
      @ml.merchant_id = params[:merchant_id]
      @mi = MerchantIncome.new
      @mi.merchant_id = params[:merchant_id]
      @mi.discount = @ml.money * @order.discount
      @mi.price = @ml.money - @mi.discount
      @mi.order_id = @order.id
      if @ml.save && @mi.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '账户录入异常'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
