class LogController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def getLogs
    @logs = Order.find_by_sql('select o.id,(o.price-o.discount)*0.1 as income,r.updated_at from riderorders r,orders o where o.id = r.order_id and r.is_del = 1 and r.rider_id = '+general_params[:rider_id])
    if @logs.size == 0
      render :json => {:status => 0, :logs => {}}
    else
      render :json => {:status => 0, :logs => @logs}
    end
  end
  private
  def general_params
    params.permit(:rider_id)
  end
end
