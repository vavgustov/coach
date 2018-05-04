class RenameFailuresToFailure < ActiveRecord::Migration[5.2]
  def change
    rename_column :words, :failures, :failure
  end
end
