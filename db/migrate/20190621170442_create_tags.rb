class CreateTags < ActiveRecord::Migration[5.2]
  def change
    create_table :tags do |t|
      t.references :product, foreign_key: true
      t.string :uuid 
      t.boolean :paid

      t.timestamps
    end

    add_index :tags, :uuid, unique: true    
  end
end
