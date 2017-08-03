class AddLikeButtonToBlogs < ActiveRecord::Migration[5.1]
  def change
    add_column :blogs, :biglikes_count, :integer, default: 0
    add_column :blogs, :likes_count, :integer, default: 0
    add_column :blogs, :dislikes_count, :integer, default: 0
    add_column :blogs, :bigdislikes_count, :integer, default: 0
  end
end
