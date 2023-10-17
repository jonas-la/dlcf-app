class Orginfo < ApplicationRecord
  validates :title, presence: true
  validates :description, presence: true

  has_one_attached :image
  has_one_attached :file
end
