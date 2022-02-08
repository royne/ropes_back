class ProductSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :dimension, :description, :photos, :colors

  def photos
    object.photos.map { |x| rails_blob_url(x) } if object.photos.attached?  
  end

  def products 
    object.colors
  end
end