class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.string :uuid
      t.boolean :deleted

      t.timestamps
    end
    add_index :sensors, :uuid, unique: true
  end
end
