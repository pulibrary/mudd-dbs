class CreateTrusteesMinutes < ActiveRecord::Migration[5.2]
  def change
    create_table :trustees_minutes do |t|
      t.string :access_id
      t.string :subject
      t.string :volume
      t.string :page

      t.timestamps null: false
    end
  end
end
