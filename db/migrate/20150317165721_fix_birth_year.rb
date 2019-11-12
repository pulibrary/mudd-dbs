class FixBirthYear < ActiveRecord::Migration[5.2]
  def change
    rename_column :faculties, :year, :birth_year
  end
end
