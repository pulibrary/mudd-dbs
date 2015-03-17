class FixBirthYear < ActiveRecord::Migration
  def change
    rename_column :faculties, :year, :birth_year
  end
end
