class StationController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def createStation
    if params[:lat] && params[:lng]
      @address = Address.new(:lat => params[:lat], :lng => params[:lng], :comment => params[:comment])
      if @address.save
        @region = Region.find_by_name(params[:region_name])
        @station = Station.new(:name => params[:name], :region => @region, :address => @address)
        if @station.save
          render :json => {:status => 0, :msg => 'success'}
        else
          render :json => {:status => 1, :msg => 'station 保存失败' }
        end
      else
        render :json => {:status => 1, :msg => 'address 保存失败'}
      end
    else
      render :json => {:status => 1, :msg => '经纬度错误', :lat => params[:lng]}
    end
  end

  def showAdminStation
    @admin = Admin.find(params[:admin_id])
    @region = Region.find(@admin.region_id)
    @stations = Station.where(:region_id => @region.id)
    if @stations
      render :json => {:status => 0, :msg => 'success', :data => {:stations => @stations}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def destroyAdminStation
    @station = Station.find(params[:station_id])
    if @station.update_attributes(:is_del => 1)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAllStation
    if params[:region_id]
      if params[:region_id].to_i == 1
        @stations = Station.where(:status => 0).where(:is_del => 0).order(:id => 'desc')
      else
        @stations = Station.where(:status => 0).where(:is_del => 0).where(:region_id => params[:region_id]).order(:id => 'desc')
      end
      if @stations
        @arr = []
        @stations.each do |station|
          @arr << Address.find(station.address_id)
        end
        render :json => {:status => 0, :msg => 'success', :data => {:stations=> @stations, :addresses => @arr}}
      else
        render :json => {:status => 1, :msg => '获取站点错误'}
      end
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

end
