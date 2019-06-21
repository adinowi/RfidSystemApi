class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :product, foreign_key: true
      t.boolean :paid

      t.timestamps
    end
  end
end
