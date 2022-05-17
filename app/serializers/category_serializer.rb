class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :image, :products, :sub_categories

  def image
     object.image.attached? ? rails_blob_url(object.image) : "" 
  end

  def products 
    object.products.map do |x|
      {
        id: x.id,
        name: x.name,
        image_url: url_for(x.photos.last)
        # image_url: Cloudinary::Utils.cloudinary_url(x.photos.first.key, cloud_name: ENV['cloudinary_cloud_name'] )
      }
    end
  end

  def sub_categories 
    object.sub_categories ? object.sub_categories.map {|x| x.name} : []
  end
  
end
