class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def new
  end

  def create
    merchant = Merchant.find_by_mail(merchant_params[:mail]).try(:authenticate, merchant_params[:password])
    if merchant
      session[:current_merchant_id] = merchant.id
      render :json => {:status => 0, :msg => 'success', :data => {:merchant => merchant}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def destroy
    session[:current_merchant_id] = nil
    render :json => {:status => 0, :msg => 'success'}
  end

  private
  def merchant_params
    params.permit(:mail, :password)
  end
end
