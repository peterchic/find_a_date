class AddColumnMessages < ActiveRecord::Migration[5.0]
  def change
    add_column :messages, :status, :boolean, default: false #false means that message is new (unread)
  end
end
