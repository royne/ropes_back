class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :colors

  has_many_attached :photos, dependent: :destroy

  before_create :name_downcase

  def name_downcase
    self.name.downcase
  end
end
