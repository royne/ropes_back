class CategorySerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attributes :id, :name, :image

  def image
     object.image.attached? ? rails_blob_url(object.image) : "" 
  end
  
end
