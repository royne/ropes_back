class Category < ApplicationRecord
  has_many :products
  
  has_one_attached :image

  before_create :name_downcase

  def name_downcase
    self.name.downcase
  end

end
