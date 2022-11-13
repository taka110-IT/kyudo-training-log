class AddIndexToPractices < ActiveRecord::Migration[7.0]
  def change
    remove_index :practices, :date
    add_index :practices, %i[date user_id], unique: true
  end
end
