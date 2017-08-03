class AddSetPublicToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :set_public, :integer, null: false, default: 0
  end
end
