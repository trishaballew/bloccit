class ChangeUserToUserIdInFavorites < ActiveRecord::Migration
  def change
    rename_column :favorites,  :user, :user_id
    change_column :favorites, :user_id, :integer
  end
end
