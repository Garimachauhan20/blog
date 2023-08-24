class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :recoverable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :rememberable, :validatable, :lockable, :confirmable

  has_many :posts, dependent: :destroy
  has_many :comments , dependent: :destroy
  has_many :likes , dependent: :destroy

  def generate_token
    SecureRandom.hex(10)
  end
  def send_password_reset_instructions
      UserMailer.reset_password_email(self).deliver_now
  end
  
  def token_valid?
    self.reset_password_sent_at > 24.hours.ago
  end

end
