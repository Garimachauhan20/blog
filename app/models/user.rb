class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable, :lockable

  def send_devise_notification(notification, *args)
  devise_mailer.send(notification, self, *args).deliver_later
  end

  has_many :posts
  has_many :comments 
  has_many :likes 
end
