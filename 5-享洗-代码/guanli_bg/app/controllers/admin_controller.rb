class AdminController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def edit
    @admin = Admin.find(params[:admin_id])
    if @admin
      if @admin.update_attributes(:nick => params[:nick], :password => params[:password], :role_id => params[:role_id])
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'save  fail'}
      end
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def showAdmin
    @admins = Admin.where(:is_del => 0).order(:id => 'desc')
    if @admins
      render :json => {:status => 0, :msg => 'success', :data => @admins}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def singleAdmin
    if params[:admin_id]
      @admin = Admin.find(params[:admin_id])
      render :json => {:status => 0, :msg => 'success', :data => @admin}
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

  def addAdmin
    @admin = Admin.new
    @admin.nick = params[:nick]
    @admin.password = params[:password]
    @admin.role_id = params[:role_id]
    @region = Region.find_by_name(params[:region_name])
    @admin.region = @region
    if @admin.save
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => @region}
    end
  end

  def removeAdmin
    @admin = Admin.find(params[:admin_id])
    if @admin.update_attributes(:is_del => 1)
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
