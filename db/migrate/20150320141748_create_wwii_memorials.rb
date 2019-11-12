class CreateWwiiMemorials < ActiveRecord::Migration[5.2]
  def change
    create_table :wwii_memorials do |t|
      t.string :access_id
      t.string :rank
      t.string :name
      t.string :death_date
      t.string :place
      t.string :year
      t.string :death_year
      t.string :last_name

      t.timestamps null: false
    end
  end
end
