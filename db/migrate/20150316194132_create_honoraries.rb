class CreateHonoraries < ActiveRecord::Migration[5.2]
  def change
    create_table :honoraries do |t|
      t.string :lname
      t.string :fname
      t.string :year
      t.string :death
      t.string :degree
      t.string :file

      t.timestamps null: false
    end
  end
end
