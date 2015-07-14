class UsersController < ApplicationController

  has_secure_password

  before_validation :on => :create, :gen_api_token

end
