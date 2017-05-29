class MerchantController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def stationMerchant
    @merchant = Merchant.find(params[:merchant_id])
    if @merchant
      @stations = @merchant.stations.where(:is_del => 0)
      @arr = []
      @stations.each do |station|
        h = Hash.new
        h[:id] = station.id
        h[:name] = station.name
        @addr = Address.find(station.address_id)
        h[:lat] = @addr.lat
        h[:lng] = @addr.lng
        @arr << h
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def bindMerchant
    @merchant = Merchant.find(params[:merchant_id])
    @station = Station.find(params[:station_id])
    if @merchant && @station
      MerchantStationship.create(:merchant => @merchant, :station => @station)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def unbindMerchant
    if params[:merchant_id] && params[:station_id]
      ActiveRecord::Base.connection.execute 'delete from merchant_stationships where merchant_id=' + params[:merchant_id] + ' and station_id= ' + params[:station_id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def unstation
    @merchant = Merchant.find(params[:merchant_id])
    @all = Station.where(:is_del => 0)
    @stations = @merchant.stations.where(:is_del => 0)
    if @all && @stations
      @arr = []
      @all.each do |sta|
        @flag = 0
        @stations.each do |ss|
          if ss.id == sta.id
            @flag = 1
            break
          end
        end
        if @flag == 0
          h = Hash.new
          @addr = Address.find(sta.address_id)
          h[:id] = sta.id
          h[:name] = sta.name
          h[:lat] = @addr.lat
          h[:lng] = @addr.lng
          @arr << h
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
