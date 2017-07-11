class CreateAdmins < ActiveRecord::Migration[5.1]
  def change
    create_table :admin do |t|
      t.string :username
      t.string :name
      t.integer :age
      t.string :subject

      t.timestamps
    end
  end
end
