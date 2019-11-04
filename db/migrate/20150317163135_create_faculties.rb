class CreateFaculties < ActiveRecord::Migration[5.2]
  def change
    create_table :faculties do |t|
      t.string :access_id
      t.string :lname
      t.string :fname
      t.string :birth
      t.string :birth
      t.string :year
      t.string :death
      t.string :leave
      t.string :dept
      t.string :box
      t.string :series

      t.timestamps null: false
    end
  end
end
