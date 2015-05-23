class ChangePostToPostIdInFavorites < ActiveRecord::Migration
  def change
    rename_column :favorites,  :post, :post_id
    change_column :favorites, :post_id, :integer
  end
end
