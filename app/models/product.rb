class Product < ApplicationRecord
  belongs_to :category
  has_many :colors

  has_many_attached :photos
end
