class LoginController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def create
    admin = Admin.find_by_nick(params[:nick]).try(:authenticate, params[:password])
    if admin
      session[:current_admin_id]  = admin.id
      render :json => {:status => 0, :msg => 'success', :data => {:admin => admin}}
    else
      render :json => {:status => 1, :msg => 'fail', :data => {}}
    end
  end

  def destroy
    session[:current_admin_id] = nil
    render :json => {:status => 0, :msg => 'success'}
  end
end
