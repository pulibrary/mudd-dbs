class RenameNewAlumniToRecentAlumni < ActiveRecord::Migration[5.2]
  def change
    rename_table :new_alumni, :recent_alumni
  end
end
