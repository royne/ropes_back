class Product < ApplicationRecord
  belongs_to :category
  has_and_belongs_to_many :colors

  has_many_attached :photos, dependent: :destroy

  before_create :name_downcase
  before_create :set_public_url

  def name_downcase
    self.name.downcase
  end

  def set_public_url
    str = self.public_url.strip.gsub(" ", "-").gsub("#", "")
    self.public_url = str
  end
end
