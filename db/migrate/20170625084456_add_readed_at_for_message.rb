class AddReadedAtForMessage < ActiveRecord::Migration[5.1]
  def change
    add_column :messages, :readed_at, :timestamp
  end
end
