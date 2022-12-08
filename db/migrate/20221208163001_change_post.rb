class ChangePost < ActiveRecord::Migration[7.0]
  def change
    change_column :posts, :comments_counter, 'integer USING CAST(comments_counter AS integer)'
  end
end
