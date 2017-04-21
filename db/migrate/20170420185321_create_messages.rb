class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.integer :user_id
      t.integer :match_id
      t.text :content
      t.string :status

      t.timestamps
    end
  end
end
