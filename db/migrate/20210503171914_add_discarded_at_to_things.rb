class AddDiscardedAtToThings < ActiveRecord::Migration[6.1]
  def change
    add_column :things, :discarded_at, :datetime
    add_index :things, :discarded_at
  end
end
