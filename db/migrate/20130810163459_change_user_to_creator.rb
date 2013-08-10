class ChangeUserToCreator < ActiveRecord::Migration
  def change
    remove_column :comments, :user_id, :integer
    remove_column :posts, :user_id, :integer
    add_column :comments, :creator_id, :integer
    add_column :posts, :creator_id, :integer
  end
end
