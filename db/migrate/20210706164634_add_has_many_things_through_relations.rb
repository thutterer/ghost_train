class AddHasManyThingsThroughRelations < ActiveRecord::Migration[6.1]
  def change
    create_table :relations do |t|
      t.references :item, index: true, foreign_key: { to_table: :things }
      t.references :list, index: true, foreign_key: { to_table: :things }

      t.string :kind
      t.timestamps
    end
  end
end
