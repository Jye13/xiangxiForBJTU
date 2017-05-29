class RegisterController < ApplicationController
  require "base64"
  skip_before_filter :verify_authenticity_token
  def new
    @merchant = Merchant.new
  end

  def sendMail
    @path = request.host_with_port.to_s
    if params[:license]
      @merchant = Merchant.find_by_mail(params[:mail])
      if @merchant
        render :json => {:status => 1, :msg => 'repeat the mail'}
      else
        #营业执照
        uploaded_io = params[:license]
        Image.upload(params[:license].tempfile.path, uploaded_io.original_filename)
        @license = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io.original_filename

        #logo
        uploaded_io1 = params[:logo]
        Image.upload(params[:logo].tempfile.path, uploaded_io1.original_filename)
        @logo = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io1.original_filename

        #身份证
        uploaded_io2 = params[:card]
        Image.upload(params[:card].tempfile.path, uploaded_io2.original_filename)
        @card = 'http://oo8xw7yv4.bkt.clouddn.com/' + uploaded_io2.original_filename
        @s = Base64.encode64(params[:nick] + ';' + params[:password] + ';' + params[:mobile] + ';' + params[:mail] + ';' + (Time.now + 60 * 30).to_s + ';' + @license + ';' + params[:comment] + ';' + @logo + ';' + @card + ';' + params[:rename] + ';' + params[:sex])
        begin
          MerchantMailer.send_mail(@s, params[:mail], @path).deliver
          render :json => {:status => 0, :msg => 'success'}
        rescue
          render :json => {:status => 1, :msg => 'no this mail'}
        end
      end
    else
      render :json => {:status => 1, :msg => 'no license'}
    end
  end

  def create
    @s = Base64.decode64(params[:msg]).split(';')
    @time = @s.at(4)
    @merchant = Merchant.new(:nick => @s.at(0), :password => @s.at(1), :mobile => @s.at(2), :mail => @s.at(3), :license => @s.at(5), :comment => @s.at(6), :logo => @s.at(7), :card => @s.at(8), :rename => @s.at(9), :sex => @s.at(10))
    if Time.now.inspect > @time
      render :json => {:status => 1, :msg => 'out time'}
    else
      if @merchant.save
        render "welcome/index"
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    end
  end

  private
  def merchant_params
    # params.permit(:nick, :password, :password_confirmation, :mobile, :mail)
    params.permit(:nick, :password, :mobile, :mail)
  end
end
