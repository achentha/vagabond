class User < ApplicationRecord
  has_many :posts
  validates :name, :current_city, presence: true
  validates :name, uniqueness: true
  
  has_secure_password

  def self.confirm(params)
      @user = User.find_by({name: params[:name]})
      @user ? @user.authenticate(params[:password]) : false
  end

end
