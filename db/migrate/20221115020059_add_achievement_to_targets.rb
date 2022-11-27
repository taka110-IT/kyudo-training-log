class AddAchievementToTargets < ActiveRecord::Migration[7.0]
  def change
    add_column :targets, :achievement, :boolean, default: false
  end
end
