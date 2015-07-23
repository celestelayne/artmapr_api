class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  skip_before_action :verify_authenticity_token,
    except: [:create, :update, :delete]
  # For APIs, you may want to use :null_session instead.
  # protect_from_forgery with: :exception

  include SessionsHelper
end
