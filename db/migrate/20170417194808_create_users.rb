class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :name
      t.string :password_digest
      t.string :city
      t.integer :age
      t.string :sex
      t.string :orientation
      t.string :ethnicity
      t.integer :height
      t.string :physical_shape
      t.integer :children
      t.string :relationship
      t.string :education
      t.string :image
      t.text :bio

      t.timestamps
    end
  end
end
