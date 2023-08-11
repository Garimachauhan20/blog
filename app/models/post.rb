class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_one_attached :image
	belongs_to :category
	belongs_to :user
	has_many :nested_forms, dependent: :destroy
	has_many :likes, dependent: :destroy
    accepts_nested_attributes_for :nested_forms, allow_destroy: true, 
    reject_if: :all_blank

	validates :image, presence: true
	validates :title, presence: true, length:{ maximum: 256}, uniqueness: true
	validates :body,  presence: true, length:{ minimum: 10 }
end
