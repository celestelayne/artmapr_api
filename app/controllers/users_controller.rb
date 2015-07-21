class UsersController < ApplicationController

  before_action :require_login, only: [:show, :reset_token]

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_signup

  def index
    @users = User.all
    # render :index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.create(user_params)
    login(@user)
    redirect_to "/account"
    # redirect_to "/users/#{@user.id}"
  end

  def show
    @user = User.find(params[:id])
    render :show
  end

  #add this to the before_action list
  def reset_token
    current_user.gen_api_token
    current_user.save
    redirect_to "/account"
  end

  protected

  def invalid_signup(e)
    flash[:error] = e.message
    redirect_to "/signup"
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password)
  end

end
