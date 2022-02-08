class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :image, :products

  def image
     object.image.attached? ? rails_blob_url(object.image) : "" 
  end

  def products 
    object.products.map do |x|
      {
        id: x.id,
        name: x.name,
        image_url: rails_blob_url(x.photos.first)
      }
    end
  end
  
end
