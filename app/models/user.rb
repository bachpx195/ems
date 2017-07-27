class User < ApplicationRecord
  devise :database_authenticatable, :rememberable, :validatable,
     authentication_keys: [:username]

  mount_uploader :avatar, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :reactions, dependent: :destroy

  protected
  def email_required?
    false
  end

  def email_changed?
    false
  end

  def will_save_change_to_email?
    false
  end
end
