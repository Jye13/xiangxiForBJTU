class UserController < ApplicationController
  skip_before_filter :verify_authenticity_token

  def allUsers
    @users = User.all
    if @users
      @arr = []
      @users.each do |user|
        @user_card = user.user_card
        h = Hash.new
        h[:id] = user.id
        h[:name] = user.name
        h[:sex] = user.sex
        h[:money] = @user_card.real_money + @user_card.fake_money
        @arr << h
      end
      render :json => {:status => 0, :msg => 'success', :data => {:users => @arr}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end

  def inputMoney
    if params[:user_id]
      if @user_card = User.find(params[:user_id]).user_card
        @user_card.update_attribute(:fake_money, params[:money].to_f + @user_card.fake_money)
        @log = Log.create(:user_card => @user_card, :real_money => @user_card.real_money, :fake_money => @user_card.fake_money, :method => '操作员充值', :status => 3)
        render :json => {:status => 0, :msg => 'success'}
      else
        render :json => {:status => 1, :msg => '用户不存在'}
      end
    else
      render :json => {:status => 1, :msg => '没有用户id'}
    end
  end
end
