class CreateShoppinglists < ActiveRecord::Migration[5.2]
  def change
    create_table :shoppinglists do |t|
      t.references :session, foreign_key: true
      t.references :tag, foreign_key: true
      t.boolean :removed

      t.timestamps
    end
  end
end
