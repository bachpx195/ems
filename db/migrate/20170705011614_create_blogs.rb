class CreateBlogs < ActiveRecord::Migration[5.1]
  def change
    create_table :blogs do |t|
      t.string :title
      t.references :category
      t.datetime :public_time
      t.integer :public_status, null: false, default: 0
      t.integer :suggest_status, null: false, default: 0
      t.string :intro_image
      t.text :content
      t.string :author_name
      t.string :author_position
      t.integer :author_age
      t.string :author_image

      t.timestamps
    end
  end
end
