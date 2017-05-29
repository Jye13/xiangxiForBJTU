class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token
  
  def list
    if params[:search] && params[:page]
      start = (params[:page].to_i - 1) * 3
      @users = User.find_by_sql("select * from users where name like '%#{params[:search]}%' limit #{start},3")
    @count = User.count/3 + 1
    render :json => {:status => 0, :msg => 'success', :data => {:users => @users, :count => @count, :page => params[:page], :search => params[:search]}}
    else
      render :json => {:status => 1, :msg => '参数错误'}
    end
  end

  def stopUser
    @user = User.find(params[:user_id])
    if @user
      if @user.update_attributes(:is_del => 1)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'not the user'}
    end
  end

  def activeUser
    @user = User.find(params[:user_id])
    if @user
      if @user.update_attributes(:is_del => 0)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => 'not the user'}
    end
  end

  def addAddress
    if params[:lat] == null || params[:lng] == null
      render :json => {:status => 1, :msg => '经纬度错误'}
    else
      @address = Address.new(:lat => params[:lat], :lng => params[:lng], :comment => params[:comment])
      if @address.save
        @user = User.find(params[:user_id])
        UserAdddressship.create(:user => @user, :address => @address)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '保存失败'}
      end
    end
  end

  def card
    if params[:user_id]
      @uc = User.find(params[:user_id]).user_card
      if @uc
        render :json => {:status => 0, :msg => 'success', :data => {:user_card => @uc}}
      else
        render :json => {:status => 1, :msg => 'fail'}
      end
    else
      render :json => {:status => 1, :msg => '参数有问题'}
    end
  end

  def inputMoney
    if params[:user_id]
      if @user_card = User.find(params[:user_id]).user_card
        @user_card.update_attribute(:fake_money, params[:money].to_f + @user_card.fake_money)
        @log = Log.create(:user_card => @user_card, :real_money => @user_card.real_money, :fake_money => params[:money], :method => '操作员充值', :status => 3)
        render :json => {:status => 0, :msg => 'success', :u => @user_card}
      else
        render :json => {:status => 1, :msg => '用户不存在'}
      end
    else
      render :json => {:status => 1, :msg => '没有用户id'}
    end
  end
end
