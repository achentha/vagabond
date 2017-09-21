class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city
  default_scope { order("created_at DESC") }
end
