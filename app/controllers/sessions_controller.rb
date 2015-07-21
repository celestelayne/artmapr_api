class SessionsController < ApplicationController

  before_action :current_user
  rescue_from ActiveRecord::RecordNotFound, with: :failed_login

  def index
    # @home_page = true
  end

  def new
    @user = User.new
    render :new
  end

  def create
    # @user = User.confirm(params)
    @user = User.confirm(params.require(:user).permit(:email, :password))

    if @user
      login(@user)
      flash[:success] = "Welcome to the ArtMapr API"
      # redirect_to @user
      redirect_to '/account'
    else
      flash[:danger] = "Invalid email/password combination"
      redirect_to login_path
    end
  end

  def destroy
    logout
    flash[:success] = "You have successfully logged out."
    redirect_to ("/")
  end

  protected

  def failed_login(e)
    flash[:error] = "Failed Login"
    redirect_to "/login"
  end

end
