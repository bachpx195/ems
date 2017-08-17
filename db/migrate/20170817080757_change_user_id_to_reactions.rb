class ChangeUserIdToReactions < ActiveRecord::Migration[5.1]
  def change
    change_column :reactions, :user_id, :string, null: true
  end
end
