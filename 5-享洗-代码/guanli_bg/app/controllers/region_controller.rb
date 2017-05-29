class RegionController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def showAdminRegion
    @admin = Admin.find(params[:admin_id])
    @region = Region.find(@admin.region_id)
    if @region
      render :json => {:status => 0, :msg => 'success', :data => {:region => @region}}
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

  def getFirstReginos
    @regions = Region.where(:level => 1)
    if @regions
      render :json => {:status => 0, :msg => 'success', :data => {:regions => @regions}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
