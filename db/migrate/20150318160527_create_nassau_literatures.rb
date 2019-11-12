class CreateNassauLiteratures < ActiveRecord::Migration[5.2]
  def change
    create_table :nassau_literatures do |t|
      t.string :lname
      t.string :fname
      t.string :classyear
      t.string :title
      t.string :date
      t.string :issue_no
      t.string :pages

      t.timestamps null: false
    end
  end
end
