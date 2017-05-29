class RegisterController < ApplicationController
  require 'base64'
  skip_before_filter :verify_authenticity_token
  def new
    @rider = Rider.new
  end

  def create
    @exist = Rider.find_by_mobile(params[:mobile])
    if @exist
      render :json => {:status => 1, :msg => 'fail', :rider_id => -1}
    else
      @rider = Rider.new
      @rider.name = params[:name]
      @rider.password = params[:password]
      @rider.mobile = params[:mobile]
      @rider.sex = params[:sex]
      @rider.license_num = params[:license_num]
      @rider.id_front = params[:id]
      @rider.region_id = params[:region_id]
      uploaded_front = params[:id_front]
      uploaded_back = params[:id_back]
      File.open(@rider.mobile+'_front.png', 'wb') do|f|
        f.write(Base64.decode64(uploaded_front))
      end
      File.open(@rider.mobile+'_back.png', 'wb') do|f|
        f.write(Base64.decode64(uploaded_back))
      end
      @rider.id_front = 'http://oo8xw7yv4.bkt.clouddn.com/' + @rider.mobile + '_front.png'
      @rider.id_back = 'http://oo8xw7yv4.bkt.clouddn.com/' + @rider.mobile+'_back.png'

      Image.upload('/root/yidong/qishou/'+@rider.mobile+'_front.png', @rider.mobile+'_front.png')
      Image.upload('/root/yidong/qishou/'+@rider.mobile+'_back.png', @rider.mobile+'_back.png')

      File.delete('/root/yidong/qishou/'+@rider.mobile+'_front.png')
      File.delete('/root/yidong/qishou/'+@rider.mobile+'_back.png')
      if @rider.save
        session[:rider_id] = @rider.id
        render :json => {:status => 0, :msg => 'success', :rider_id => @rider.id}
      else
        render :json => {:status => 1, :msg => 'fail', :rider_id => -1}
      end
    end
  end

  private
  def rider_params
    params.permit(:name, :password, :mobile, :sex, :license_num, :id_front, :id_back, :region_id)
  end
  def verify_params
    params.permit(:verification)
  end
end