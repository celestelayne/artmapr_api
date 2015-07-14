module SessionsHelper
  def login(user)
    session[:user_id] = user.id
    @current_owner = user
  end

  def logout
    @current_owner = session[:user_id] = nil
  end

  def current_owner
    @current_owner ||= User.find_by(id: session[:user_id])
  end

  def logged_in?
    !current_owner.nil?
  end

  def require_login
    if !logged_in?
      redirect_to '/login'
  end

end
