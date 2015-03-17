class CreateMemorabilia < ActiveRecord::Migration
  def change
    create_table :memorabilia do |t|
      t.string :box
      t.string :category
      t.string :description
      t.string :classyear
      t.string :year
      t.string :reunion
      t.string :provenance

      t.timestamps null: false
    end
  end
end
