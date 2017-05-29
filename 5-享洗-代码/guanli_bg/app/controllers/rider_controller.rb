class RiderController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def bindRider
    @rider = Rider.find(params[:rider_id])
    @station = Station.find(params[:station_id])
    if @rider && @station
      RiderStationship.create(:rider => @rider, :station => @station)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showRider
    if params[:region_id]
      if params[:region_id] == 1
        @riders = Rider.all
      else
        @riders = Rider.where(:region_id => params[:region_id])
      end
      render :json => {:status => 0, :msg => 'success', :data => {:riders => @riders}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def unbindRider
    if params[:rider_id] && params[:station_id]
      ActiveRecord::Base.connection.execute 'delete from rider_stationships where rider_id=' + params[:rider_id] + ' and station_id= ' + params[:station_id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def stationRider
    @rider = Rider.find(params[:rider_id])
    if @rider
      @stations = @rider.stations.where(:is_del => 0)
      @arr = []
      @stations.each do |station|
        h = Hash.new
        h[:station_id] = station.id
        h[:station_name] = station.name
        @addr = Address.find(station.address_id)
        h[:address_lat] = @addr.lat
        h[:address_lng] = @addr.lng
        @arr << h
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def unstation
    @rider = Rider.find(params[:rider_id])
    @all = Station.where(:is_del => 0)
    @stations = @rider.stations.where(:is_del => 0)
    if @rider && @all
      @arr = []
      @all.each do |sta|
        @a = 0
        @stations.each do |ss|
          if ss.id == sta.id
            @a = 1
            break
          end
        end
        if @a == 0
          h = Hash.new
          @addr = Address.find(sta.address_id)
          h[:station_id] = sta.id
          h[:station_name] = sta.name
          h[:address_lat] = @addr.lat
          h[:address_lng] = @addr.lng
          @arr << h
        end
      end
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
