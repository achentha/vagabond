class User < ApplicationRecord
  has_many :posts
  has_many :comments
  has_attached_file :avatar, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "http://gazettereview.com/wp-content/uploads/2016/06/myspce-tom-photo-300x300.jpg"
  validates_attachment_content_type :avatar, content_type: /\Aimage\/.*\z/
  validates :name, :current_city, presence: true
  validates :name, uniqueness: true
  
  has_secure_password

  def self.confirm(params)
      @user = User.find_by({name: params[:name]})
      @user ? @user.authenticate(params[:password]) : false
  end

end
