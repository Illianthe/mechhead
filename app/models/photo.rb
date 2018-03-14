class Photo < ApplicationRecord
  has_one_attached :image

  validates :reddit_id, presence: true, uniqueness: true
end
