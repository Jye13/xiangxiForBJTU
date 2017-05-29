class OrderController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def getorder
    if !get_params[:rider_id]
      render :json => {:status => 1, :orders => {}}
    else
      @order1 = Order.find_by_sql('select o.id,ur.name,o.price,(o.price*0.1) as income,p.name as pname,o.product_nums,o.status,u.address,u.phone,u.latitude,u.longitude from orders o,useraddresses u,users ur, products p where o.product_id = p.id and o.address_id = u.id and ur.id = u.user_id and o.is_del = 0 and o.status = 1 and u.latitude BETWEEN '+get_params[:latitude]+'-0.1 and '+get_params[:latitude]+'+0.1 and u.longitude BETWEEN '+get_params[:longitude]+'-0.1 and '+get_params[:longitude]+'+0.1')
      @order7 = Order.find_by_sql('select o.id,ur.name as username,o.price,o.status,p.name as pname,o.product_nums,u.address,u.phone,u.latitude as ulat,u.longitude as ulng,a.lat as slat,a.lng as slng,a.name as sname from orders o,useraddresses u,users ur,orderstations os,stations s,addresses a,products p where o.product_id = p.id and o.id = os.order_id and os.station_id = s.id and s.address_id = a.id and o.address_id = u.id and ur.id = u.user_id and o.is_del = 0 and o.status = 7 and a.lat BETWEEN '+get_params[:latitude]+'-0.1 and '+get_params[:latitude]+'+0.1 and a.lng BETWEEN '+get_params[:longitude]+'-0.1 and '+get_params[:longitude]+'+0.1')
      if @order1.size == 0 && @order7.size == 0
        render :json => {:status => 0, :weiqusong => {}, :daihuipai => {}}
      elsif @order1.size == 0 && @order7.size != 0
        render :json => {:status => 0, :weiqusong => {}, :daihuipai => @order7}
      elsif @order1.size != 0 && @order7.size == 0
        render :json => {:status => 0, :weiqusong => @order1, :daihuipai => {}}
      else
        render :json => {:status => 0, :weiqusong => @order1, :daihuipai => @order7}
      end
    end
  end

  def graborder
    if !send_params[:order_id] || !send_params[:rider_id]
      render :json => {:status => 1, :msg => 'fail'}
    else
      @order = Order.find(send_params[:order_id])
      @send = Riderorder.new(send_params)
      if @order.update_attributes!(:status => @order.status + 1) && @send.save
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  def sendtostation
    if !station_params[:order_id] || !station_params[:rider_id]
      render :json => {:status => 1, :msg => 'fail'}
    else
      @order = Order.find(station_params[:order_id])
      @send = Orderstation.new(:order_id => station_params[:order_id], :station_id => station_params[:station_id])
      @update = Riderorder.where(:rider_id => station_params[:rider_id]).where(:order_id => station_params[:order_id]).where(:is_del => 0).first()
      if @order.update_attributes!(:status => 4) && @send.save && @update.update_attributes!(:is_del => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  def sendtouser
    if !user_params[:order_id]
      render :json => {:status => 1, :msg => 'fail'}
    else
      @order = Order.find(user_params[:order_id])
      @update = Riderorder.where(:rider_id => user_params[:rider_id]).where(:order_id => user_params[:order_id]).where(:is_del => 0).first()
      if @order.update_attributes!(:status => 9) && @update.update_attributes!(:is_del => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  private
  def get_params
    params.permit(:rider_id, :latitude, :longitude)
  end

  private
  def send_params
    params.permit(:rider_id, :order_id)
  end

  private
  def station_params
    params.permit(:rider_id, :order_id, :station_id)
  end

  private
  def user_params
    params.permit(:rider_id, :order_id)
  end
end
