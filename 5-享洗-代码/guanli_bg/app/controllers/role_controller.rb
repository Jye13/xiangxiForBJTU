class RoleController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def roleList
    @roles = Role.all
    render :json => {:status => 0, :msg => 'success', :data => {:role => @roles}}
  end

  def roleService
    if params[:role_id]
      @roots = Role.find(params[:role_id]).services.where(:pid => 0)
      @father = []
      @roots.each do |root|
        @services = Role.find(params[:role_id]).services.where(:pid => root.id)
        child = Hash.new
        child[:id] = root.id
        child[:root] = root.function
        @ak = []
        @services.each do |service|
          h = Hash.new
          h[:id] = service.id
          h[:root] = service.function
          h[:url] = service.url
          @ak << h
        end
        child[:child] = @ak
        @father << child
      end
      render :json => {:status => 0, :msg => 'success', :data => {:service => @father}}
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end

  def notService
    if params[:role_id]
      @nss = Service.find_by_sql("select * from services where pid!=0")
      @rss = Role.find(params[:role_id]).services
      @arr = []
      @nss.each do |ns|
        flag = 0
        @rss.each do |rs|
          if rs.id == ns.id
            flag = 1
            break
          end
        end
        if flag == 0
          h = Hash.new
          h[:id] = ns.id
          h[:pid] = ns.pid
          h[:function] = ns.function
          h[:url] = ns.url
          @arr << h
        end
      end

      @father = []
      @vis = []
      @arr.each do |arr|
        if @vis[arr[:pid]] == 1
          next
        end
        @vis[arr[:pid]] = 1
        @ak = []
        @root = Service.find(arr[:pid])
        child = Hash.new
        child[:id] = @root.id
        child[:root] = @root.function
        @arr.each do |ab|
          if ab[:pid] == @root.id
            h = Hash.new
            h[:id] = ab[:id]
            h[:root] = ab[:function]
            h[:url] = ab[:url]
            @ak << h
          end
        end
        child[:child] = @ak
        @father << child
      end
      render :json => {:status => 0, :msg => 'success', :data => {:service => @father}}
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end

  def addService
    if params[:role_id] && params[:service_id]
      @service = Service.find(params[:service_id])
      @father = Service.find(@service.pid)
      if Role.find(params[:role_id]).services.where(:id => @service.pid) == []
        @rs = RoleServiceship.new
        @rs.role_id = params[:role_id]
        @rs.service_id = @service.pid
        @rs.save
      end
      @ra = RoleServiceship.new
      @ra.role_id = params[:role_id]
      @ra.service_id = params[:service_id]
      if @ra.save
        render :json => {:status => 0, :msg => 'success'};
      else
        render :json => {:status => 1, :msg => '权限角色无法保存'}
      end
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end

  def deleteService
    if params[:service_id] && params[:role_id]
      ActiveRecord::Base.connection.execute 'delete from role_serviceships where service_id=' + params[:service_id] + ' and role_id=' + params[:role_id]
      render :json => {:status => 0, :msg => 'success'}
    else
      render :json => {:status => 1, :msg => '角色参数错误'}
    end
  end

end
