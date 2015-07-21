class User < ActiveRecord::Base

  before_save { self.email = email.downcase }
  has_secure_password

  # before_validation :on => :create, :gen_api_token

  # validates :api_token,
  #           uniqueness: true
  #
  # validates :email,
  #           presence: true,
  #           uniqueness: true
  #
  # validates :email_confirmation,
  #           presence: true
  #
  # validates :first_name,
  #           :last_name,
  #           presence: true

  def self.confirm(params)
    @user = User.find_by({email: params[:email]})
    @user.try(:authenticate, params[:password])
  end

  def gen_api_token
    token = SecureRandom.uuid

    #run simple validation
    until User.find_by(api_token: token).nil?
      token = SecureRandom.uuid
    end

    self.api_token = token

  end

end
