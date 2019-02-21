class Post < ApplicationRecord
  belongs_to :user
  mount_uploader :image, ImageUploader

  default_scope -> { order(created_at: :desc)}


end
