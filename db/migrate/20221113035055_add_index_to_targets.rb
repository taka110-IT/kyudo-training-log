class AddIndexToTargets < ActiveRecord::Migration[7.0]
  def change
    remove_index :targets, %i[year month]
    add_index :targets, %i[year month user_id], unique: true
  end
end
