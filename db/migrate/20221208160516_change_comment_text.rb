class ChangeCommentText < ActiveRecord::Migration[7.0]
  def change
    change_table(:comments) do |t|
  t.change :text, :text
end
  end
end
