class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  default_scope -> { order(created_at: :desc)}
  # get current_user posts,and others posts.
  scope :user_posts, ->(user) { where(user_id: user.id).order(created_at: :desc)}


end
