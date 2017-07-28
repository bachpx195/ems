class CreateReactions < ActiveRecord::Migration[5.1]
  def change
    create_table :reactions do |t|
      t.references :user
      t.references :blog
      t.integer :rate_type, null: false, default: 0

      t.timestamps
    end
  end
end
