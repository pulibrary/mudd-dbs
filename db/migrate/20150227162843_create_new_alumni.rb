class CreateNewAlumni < ActiveRecord::Migration[5.2]
  def change
    create_table :new_alumni do |t|
      t.string :lname
      t.string :fname
      t.string :year
      t.string :pubfile
      t.string :academicfile

      t.timestamps null: false
    end
  end
end
