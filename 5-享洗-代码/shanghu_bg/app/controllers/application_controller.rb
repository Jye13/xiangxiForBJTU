class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_merchant
    @current_merchant ||= session[:current_merchant_id] && Merchant.find(session[:current_merchant_id])
  end
end
