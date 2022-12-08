class ChangePostLikesCounter < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :text , :text
    change_column :posts, :likes_counter, 'integer USING CAST(likes_counter AS integer)'
  end
end
