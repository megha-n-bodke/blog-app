class ChangeUserBio < ActiveRecord::Migration[7.0]
  def change
    change_table(:users) do |t|
      t.change :bio, :text
    end
  end
end
