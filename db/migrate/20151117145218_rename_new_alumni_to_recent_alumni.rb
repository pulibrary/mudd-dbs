class RenameNewAlumniToRecentAlumni < ActiveRecord::Migration
  def change
    rename_table :new_alumni, :recent_alumni
  end
end
