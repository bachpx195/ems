class User < ApplicationRecord
  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy
end
