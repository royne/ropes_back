class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :dimension, :description, :photos, :colors, :category, :public_url

  def photos
    #  object.photos.map { |x| url_for(x) }
    object.photos.map { |x| Cloudinary::Utils.cloudinary_url(x.key, cloud_name: ENV['cloudinary_cloud_name'] ) } if object.photos.attached?  
  end

  def products 
    object.colors
  end

  def category
    object.category
  end
end