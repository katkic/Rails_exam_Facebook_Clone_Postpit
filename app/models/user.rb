class User < ApplicationRecord
  has_secure_password
  before_validation { email.downcase! }
  has_many :posts, dependent: :destroy
  mount_uploader :image, ImageUploader

  validates :last_name, presence: true, length: { maximum: 15 }
  validates :first_name, presence: true, length: { maximum: 15 }
  validates :email, presence: true,
                    uniqueness: true,
                    length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i,
                              allow_blank: true }
  validates :password, length: { minimum: 8, allow_blank: true }
end
