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
        image_url: Cloudinary::Utils.cloudinary_url(x.photos.first.key, cloud_name: ENV['cloudinary_cloud_name'] )
      }
    end
  end
  
end
