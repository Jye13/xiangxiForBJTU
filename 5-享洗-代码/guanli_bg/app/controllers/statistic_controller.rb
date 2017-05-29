class StatisticController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def statisticSex
    @maleCount = User.all.where(:sex => 'male').count
    @femaleCount = User.all.where(:sex => 'female').count
    if @maleCount && @femaleCount
      render :json => {:status => 0, :msg => 'success', :data => {:male => @maleCount, :female => @femaleCount}}
    else
      render :json => {:status => 1, :msg => 'fail', :data => {}}
    end
  end

  def statisticRegion
    @regions = Region.where(:level => 1)
    if @regions
      @arr = []
      @regions.each do |region|
        @count = Station.where(:region_id => region.id).count
        h = Hash[:region => region, :count => @count]
        @arr << h
      end
      render :json => {:status => 0, :msg => 'success', :data => {:statistic => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def logs
    start = (params[:page].to_i - 1) * 5
    @logs = Log.find_by_sql("select * from logs limit #{start},6")
    @count = Log.count/6 + Log.count%6
    if @logs
      render :json => {:status => 0, :msg => 'success', :data => {:logs => @logs, :count => @count, :page => params[:page]}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

end
