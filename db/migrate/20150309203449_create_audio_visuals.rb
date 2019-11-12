class CreateAudioVisuals < ActiveRecord::Migration[5.2]
  def change
    create_table :audio_visuals do |t|
      t.string :item
      t.string :box
      t.string :topic
      t.string :title
      t.string :creator
      t.string :year
      t.string :format
      t.string :color
      t.string :duration
      t.string :copied
      t.string :notes
      t.string :id3
      t.string :index

      t.timestamps null: false
    end
  end
end
