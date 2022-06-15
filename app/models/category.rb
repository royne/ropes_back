class Category < ApplicationRecord
  has_many :products
  has_many :sub_categories, class_name: "Category", foreign_key: "parent_category_id"
  belongs_to :parent_category, class_name: "Category", foreign_key: "parent_category_id", optional: true
  
  has_one_attached :image

  before_create :name_downcase
  before_create :set_public_url
  after_create :assign_parent

  scope :parents, -> { where(:parent_category_id => nil)}
 
 
  def assign_parent
    if self.parent_category_id == 0
      self.parent_category_id = nil
    end
  end

  def name_downcase
    self.name.downcase
  end

  def set_public_url
    str = self.public_url.strip.gsub(" ", "-").gsub("#", "")
    self.public_url = str
  end

end
