class CreateTrustees < ActiveRecord::Migration[5.2]
  def change
    create_table :trustees do |t|
      t.string :access_id
      t.string :full_name
      t.string :trustee_type
      t.string :dates_of_service
      t.string :university_status
      t.string :first_year

      t.timestamps null: false
    end
  end
end
