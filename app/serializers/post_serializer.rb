class PostSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

	attributes :title , :body, :image_url

	belongs_to :category

	def image_url
      return rails_blob_path(object.image , only_path: true) if object.image.attached?
        return nil 
	end
end
