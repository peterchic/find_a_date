class User < ApplicationRecord
  has_secure_password
  has_many :matches
  has_many :interests, through: :matches

  validates_presence_of :name, :age, :password_digest, :city, :sex, :orientation, :ethnicity, :height, :physical_shape, :children, :relationship, :education, :image, :bio
  validates :bio, length: {minimum: 1, maximum: 1000}

end
