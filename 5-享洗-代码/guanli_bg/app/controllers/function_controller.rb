class FunctionController < ApplicationController
  skip_before_filter :verify_authenticity_token
  def allFuntion
    @functions = Function.all
    if @functions
      render :json => {:status => 0, :msg => 'success', :data => {:@functions => @functions}}
    else
      render :json => {:status => 1, :msg => 'fail'}
    end
  end
end
