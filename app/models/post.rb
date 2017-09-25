class Post < ApplicationRecord
  belongs_to :user
  belongs_to :city
  has_many :comments

  validates :title, :content, presence: true
  validates :title, length: {maximum: 200}

  default_scope { order("created_at DESC") }
  # Format files to be more readable.
  # Use your best judgment – in this file, I separated code by functionality
  # (associations, validations, etc.)
end
