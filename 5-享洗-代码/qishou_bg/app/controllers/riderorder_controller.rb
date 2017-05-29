class RiderorderController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def getmyorder
    if !get_params[:rider_id]
      render :json => {:status => 1, :orders => {}}
    else
      @order2 = Order.find_by_sql('select o.id,ur.name,o.price,p.name as pname,o.product_nums,o.status,u.address,u.phone,u.latitude as ulat,u.longitude as ulng from riderorders r,orders o,products p,users ur,useraddresses u WHERE r.is_del = 0 and r.rider_id = '+get_params[:rider_id]+' and r.order_id = o.id and o.user_id = ur.id and o.product_id = p.id and o.address_id = u.id and o.status = 2')
      @order8 = Order.find_by_sql('select o.id,ur.name,o.price,p.name as pname,o.product_nums,o.status,u.address,u.phone,u.latitude as ulat,u.longitude as ulng,a.lat as slat,a.lng as slng,a.name as sname from orderstations os,stations s,addresses a,riderorders r,orders o,products p,users ur,useraddresses u WHERE r.is_del = 0 and r.rider_id = '+get_params[:rider_id]+' and os.station_id = s.id and s.address_id = a.id and os.order_id = r.order_id and os.order_id = o.id and r.order_id = o.id and o.user_id = ur.id and o.product_id = p.id and o.address_id = u.id and o.status = 8')
      @orderh = Order.find_by_sql('select o.id,ur.name,o.price,p.name as pname,o.product_nums,o.status,u.address,u.phone,a.name as sname,r.updated_at from orderstations os,stations s,addresses a,riderorders r,orders o,products p,users ur,useraddresses u WHERE r.rider_id = '+get_params[:rider_id]+' and os.station_id = s.id and s.address_id = a.id and os.order_id = r.order_id and os.order_id = o.id and r.order_id = o.id and o.user_id = ur.id and o.product_id = p.id and o.address_id = u.id and r.is_del = 1')
      if @order2.size == 0 && @order8.size == 0 && @orderh.size == 0
        render :json => {:status => 0, :songzhandian => {}, :songyonghu => {}, :history => {}}
      elsif @order2.size == 0 && @order8.size == 0 && @orderh.size != 0
        render :json => {:status => 0, :songzhandian => {}, :songyonghu => {}, :history => @orderh}
      elsif @order2.size == 0 && @order8.size != 0 && @orderh.size == 0
        render :json => {:status => 0, :songzhandian => {}, :songyonghu => @order8, :history => {}}
      elsif @order2.size != 0 && @order8.size == 0 && @orderh.size == 0
        render :json => {:status => 0, :songzhandian => @order2, :songyonghu => {}, :history => {}}
      elsif @order2.size != 0 && @order8.size == 0 && @orderh.size != 0
        render :json => {:status => 0, :songzhandian => @order2, :songyonghu => {}, :history => @orderh}
      elsif @order2.size != 0 && @order8.size != 0 && @orderh.size == 0
        render :json => {:status => 0, :songzhandian => @order2, :songyonghu => @order8, :history => {}}
      elsif @order2.size == 0 && @order8.size != 0 && @orderh.size != 0
        render :json => {:status => 0, :songzhandian => {}, :songyonghu => @order8, :history => @orderh}
      else
        render :json => {:status => 0, :songzhandian => @order2, :songyonghu => @order8, :history => @orderh}
      end
    end
  end

  private
  def get_params
    params.permit(:rider_id)
  end
end
