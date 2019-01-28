class PostsChangeUserRef < ActiveRecord::Migration[5.2]
  def change
    remove_column :posts, :user_id, :integer
    add_column :posts, :author_id, :integer
  end
end
