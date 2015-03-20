class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.string :image_num
      t.string :box
      t.string :item_num
      t.string :accession_num
      t.string :e_num
      t.string :negative_num
      t.string :image_type
      t.string :provenance
      t.string :photographer
      t.string :date_taken
      t.string :division
      t.string :subseries
      t.string :general_sub
      t.string :specific_sub
      t.string :publication
      t.string :notes
      t.string :online_image

      t.timestamps null: false
    end
  end
end
