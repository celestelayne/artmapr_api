class SessionsController < ApplicationController

  rescue_from ActiveRecord::RecordNotFound, with: :failed_login

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(params)
    login(@user)
    redirect_to "/account"
  end

  protected

  def failed_login(e)
    flash[:error] = "Failed Login"
    redirect_to "/login"
  end

end
