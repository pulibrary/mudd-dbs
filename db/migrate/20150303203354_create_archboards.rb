class CreateArchboards < ActiveRecord::Migration[5.2]
  def change
    create_table :archboards do |t|
      t.decimal :numbers_assigned
      t.integer :original_assigned
      t.string :building_info_sheet
      t.string :drawing_title
      t.string :drawing_number
      t.string :project_type
      t.string :drawing_type
      t.string :board_date
      t.string :board_dimensions
      t.string :color
      t.string :drawing_view
      t.string :elevation
      t.string :comments
      t.string :contractor1_type
      t.string :contractor1_name
      t.string :contractor2_type
      t.string :contractor2_name
      t.string :contractor3_type
      t.string :contractor3_name
      t.integer :proposal
      t.integer :not_constructed
      t.integer :bw_fiche

      t.timestamps null: false
    end
  end
end
