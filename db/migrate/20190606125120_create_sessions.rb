class CreateSessions < ActiveRecord::Migration[5.2]
  def change
    create_table :sessions do |t|
      t.references :sensor, foreign_key: true
      t.string :auth_token
      t.boolean :expired

      t.timestamps
    end
  end
end
