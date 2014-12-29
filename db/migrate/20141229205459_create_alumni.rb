class CreateAlumni < ActiveRecord::Migration
  def change
    create_table :alumni do |t|
      t.string :box
      t.string :lname
      t.string :fname
      t.string :year
      t.string :graduate
      t.string :photos
      t.string :oversize

      t.timestamps
    end
  end
end
