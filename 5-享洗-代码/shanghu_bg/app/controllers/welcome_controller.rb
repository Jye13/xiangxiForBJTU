class WelcomeController < ApplicationController
  def index
    if current_merchant
      render :json => {:status => 0, :msg => 'yes'}
    else
      render :json => {:status => 1, :msg => 'no'}
    end
  end
end
