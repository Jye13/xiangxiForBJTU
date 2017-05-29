class StatisticController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def log
    if params[:merchant_id]
      @logs = Merchant.find(params[:merchant_id]).merchant_logs
      render :json => {:status => 0, :msg => 'success', :data => {:logs => @logs}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def discount
    if params[:merchant_id]
      @price = 0
      @discount = 0
      @mis = Merchant.find(params[:merchant_id]).merchant_incomes
      @mis.each do |mi|
        @price = @price + mi.price
        @discount = @discount + mi.discount
      end
      render :json => {:status => 0, :msg => 'success', :data => {:price => @price, :discount => @discount}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
