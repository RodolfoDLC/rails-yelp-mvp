class Review < ApplicationRecord
  RATINGS = (0..5)
  belongs_to :restaurant
  validates :content, presence: true
  validates :rating, numericality: { in: RATINGS, only_integer: true }
end
