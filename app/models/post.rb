class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city
  validates :title, :content, presence: true
  default_scope { order("created_at DESC") }
end
