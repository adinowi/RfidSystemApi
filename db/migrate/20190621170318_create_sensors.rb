class CreateSensors < ActiveRecord::Migration[5.2]
  def change
    create_table :sensors do |t|
      t.boolean :deleted

      t.timestamps
    end
  end
end
