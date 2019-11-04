class CreateMemorials < ActiveRecord::Migration[5.2]
  def change
    create_table :memorials do |t|
      t.string :publication
      t.string :volume
      t.string :no
      t.string :publish_date
      t.string :type
      t.string :subject
      t.string :class_year
      t.string :class_grade
      t.string :page

      t.timestamps null: false
    end
  end
end
