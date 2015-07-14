class User < ActiveRecord::Base
  has_secure_password

  def self.confirm(params)
    user = self.find_by!(email: params[:email])
    user.authenticate(params[:password])
  end
  
end
