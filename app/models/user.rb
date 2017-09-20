class User < ApplicationRecord
  has_many :posts
  
  has_secure_password

  def self.confirm(params)
      @user = User.find_by({name: params[:name]})
      @user ? @user.authenticate(params[:password]) : false
  end

end
