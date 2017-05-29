class StationController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def getFirstRegions
    @regions = Region.where(:level => 1)
    if @regions
      render :json => {:status => 0, :msg => 'success', :data => {:regions => @regions}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def getAllRegions
    @regions = Region.all
    if @regions
      render :json => {:status => 0, :msg => 'success', :data => {:regions => @regions}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def destroyStation
    @station = Station.find(params[:station_id])
    if @station
      @station.update_attributes(:status => 0);
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showStation
    if params[:query]
      @stations = Station.where(:merchant_id => session[:current_merchant_id]).where(:is_del => 0).ransack(:name_cont => params[:query])
    else
      @stations = Station.where(:merchant_id => session[:current_merchant_id]).where(:is_del => 0)
    end
    if @stations
      @arr = []
      @stations.each do |station|
        @arr << Address.find(station.address_id)
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @stations, :addresses => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAllStation
    if params[:query]
      @stations = Station.where(:status => 0).where(:is_del => 0).ransack(:name_cont => params[:query])
    else
      @stations = Station.where(:status => 0).where(:is_del => 0)
    end
    if @stations
      render :json => {:status => 0, :msg => 'success', :data => {:stations=> @stations}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def bindMerchant
    if params[:station_id]
      @merchant_id = session[:current_merchant_id]
      @station = Station.find(params[:station_id])
      @station.update_attributes(:merchant_id => @merchant_id)
      @station.update_attributes(:status => 1)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
