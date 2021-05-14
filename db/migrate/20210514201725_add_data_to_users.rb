class AddDataToUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :data, :jsonb, null: false, default: {}
    add_index :users, :data, using: :gin
  end
end
