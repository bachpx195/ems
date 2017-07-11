class Admin < ApplicationRecord
  self.table_name = "admin"
  devise :database_authenticatable, :rememberable, :validatable,
    authentication_keys: [:username]

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
