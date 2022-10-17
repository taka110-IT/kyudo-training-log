class CreateProspects < ActiveRecord::Migration[7.0]
  def change
    create_table :prospects do |t|
      t.integer :total
      t.integer :year, null: false
      t.integer :month, null: false
      t.references :user, foreign_key: true

      t.timestamps
    end
    add_index :prospects, %i[year month], unique: true
  end
end
