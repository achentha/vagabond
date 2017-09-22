class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments
  validates :title, :content, presence: true
  validates :title, length: {maximum: 200}
  default_scope { order("created_at DESC") }
end
