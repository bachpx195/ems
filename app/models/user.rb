class User < ApplicationRecord
  has_many :comments, dependent: :nullify
  has_many :reactions, dependent: :nullify
end
