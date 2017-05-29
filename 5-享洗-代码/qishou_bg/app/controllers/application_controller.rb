class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  private
  def current_rider
    @current_rider ||= session[:rider_id] && Rider.find(session[:rider_id])
  end

end
