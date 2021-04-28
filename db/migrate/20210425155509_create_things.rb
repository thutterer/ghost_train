class CreateThings < ActiveRecord::Migration[6.1]
  def change
    create_table :things do |t|
      t.integer :user_id
      t.jsonb :data, null: false, default: {}

      t.timestamps
    end
    add_index :things, :data, using: :gin
  end
end
