class CreateShoppingsessions < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppingsessions do |t|
      t.references :sensor, foreign_key: true
      t.references :user, foreign_key: true
      t.boolean :active

      t.timestamps
    end
  end
end
