class RenameMatchestoUserInterests < ActiveRecord::Migration[5.0]
  def change
    rename_table :matches, :user_interests
  end
end
