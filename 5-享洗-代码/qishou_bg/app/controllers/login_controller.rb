class LoginController < ApplicationController
    skip_before_filter :verify_authenticity_token
    def new
    end

    def login
      @type = params[:type]
      if @type == '1'
        rider = Rider.find_by(:mobile => params[:mobile]).try(:authenticate, params[:password])
        if rider
          session[:rider_id] = rider.id
          render :json => {:status => 0, :msg => 'success', :rider_id => rider.id}
        else
          render :json => {:status => 1, :msg => 'failed', :rider_id => -1}
        end
      else
        rider = Rider.find_by(:mobile => params[:mobile])
        if rider
          session[:rider_id] = rider.id
          render :json => {:status => 0, :msg => 'success', :rider_id => rider.id}
        else
          render :json => {:status => 1, :msg => 'failed', :rider_id => -1}
        end
      end
    end

    def destroy
      session[:rider_id] = nil
      render :json => {:status => 0, :msg => 'success'}
    end

    private
    def rider_params
      params.permit(:mobile, :password, :type, :verification)
    end
end

