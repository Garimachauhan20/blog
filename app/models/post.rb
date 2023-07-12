class Post < ApplicationRecord
	has_many :comments, dependent: :destroy
	has_one_attached :image
	belongs_to :category
	
	validates :image, presence: true
	validates :title, presence: true, length:{ maximum: 256}, uniqueness: true
	validates :body, presence: true, length: { minimum: 10 }
end