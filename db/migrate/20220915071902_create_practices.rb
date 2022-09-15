class CreatePractices < ActiveRecord::Migration[7.0]
  def change
    create_table :practices do |t|
      t.date :date, null: false, index: { unique: true }
      t.integer :shooting_count
      t.text :memo
      t.boolean :fixed, default: false
      t.boolean :important, default: false

      t.timestamps
    end
  end
end
