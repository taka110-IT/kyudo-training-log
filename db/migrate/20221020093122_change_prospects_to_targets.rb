class ChangeProspectsToTargets < ActiveRecord::Migration[7.0]
  def change
    rename_table :prospects, :targets
  end
end
