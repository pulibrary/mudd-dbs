class CreateGraduates < ActiveRecord::Migration
  def change
    create_table :graduates do |t|
      t.string :box
      t.string :lastname
      t.string :firstname
      t.string :year
      t.string :department
      t.string :deathdate
      t.string :photos
      t.string :oversize

      t.timestamps null: false
    end
  end
end
