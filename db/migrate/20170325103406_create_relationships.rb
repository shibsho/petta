class CreateRelationships < ActiveRecord::Migration[5.0]
  def change
    create_table :relationships do |t|
      t.integer :from_id
      t.integer :target_id

      t.timestamps
    end
  end
end
