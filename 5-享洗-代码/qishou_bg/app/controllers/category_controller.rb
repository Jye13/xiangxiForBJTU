class CategoryController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def getCategory
    @user_id = params[:id]
    #if session[:user_id] == @user_id
    @category = Category.find_each
    if @category
      render :json => {:status => 0, :goods => @category}
    else
      render :json => {:status => 1, :goods => {}}
    end
    #else
    #render :json => {:status => 1, :goods => {}}
    #end
  end

  private
  def user_params
    params.permit(:id)
  end
end