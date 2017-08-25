class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable, :confirmable,
  authentication_keys: [:email]

  mount_uploader :avatar, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
