class UsersController < ApplicationController

  before_action :require_login, only: [:show, :reset_token]
  before_filter :redirect_unauthenticated, except: [:new, :create, :show]

  rescue_from ActiveRecord::RecordInvalid, with: :invalid_signup

  def index
    @users = User.all
    # @user = current_user
    # @users = User.order(:last_name).page params[:page]
    render :index
  end

  def new
    @user = User.new
  end

  # POST /users
  # POST /users.json
  def create
    @user = User.create!(user_params)
    # if @user.save
    #   login(@user)
    #   flash[:success] = "Welcome to the ArtMapr API"
    #   redirect_to @user
    # else
    #   render :new
    # end

    login(@user)
    redirect_to '/account'
  end

  def show
    # @user = User.find(params[:id])
    @user = current_user
    render :show
  end

  # GET /users/1/edit
  def edit
    @user = User.find(params[:id])
    # if current_user == @user
    # else
    #   flash[:warning] = "Sorry, you can only edit your own profile"
    #   redirect_to user_path
    # end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @current_user.update_attributes(user_params)
        format.html { redirect_to @current_user, alert: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @current_user }
      else
        format.html { render :edit }
        format.json { render json: @current_user.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:id]).destroy
    flash[:success] = "User deleted"
    redirect_to users_path
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

  def set_user
    unless current_user
      flash[:error] = "You must be logged in to continue."
      redirect_to login_path
    end
  end

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email,
                                  :password, :password_confirmation)
  end

end
