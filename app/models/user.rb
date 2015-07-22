# == Schema Information
#
# Table name: users
#
#  id              :integer          not null, primary key
#  first_name      :string
#  last_name       :string
#  email           :string
#  password_digest :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  api_token       :string
#

class User < ActiveRecord::Base

  has_secure_password

  before_create :generate_api_token
  before_save :check_and_set_token

  validates_presence_of :first_name, :last_name, :email
  validates_uniqueness_of :email

  def self.confirm(params)
    user = self.find_by!(email: params[:email])
    user.authenticate(params[:password])
  end

  #edge_case check for uniquness of randomized token
  def generate_api_token
    self.api_token = SecureRandom.uuid
  end

  #User.find_each(&:save) this sets all tokens if not set
  #this can be a rake task eventually
  def check_and_set_token
    generate_api_token if self.api_token.nil?
  end

  #to be filled in (mailer needed or something plus background process)
  def send_email_confirmation
  end

end
