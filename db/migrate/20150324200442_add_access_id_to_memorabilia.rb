class AddAccessIdToMemorabilia < ActiveRecord::Migration[5.2]
  def change
    add_column :memorabilia, :access_id, :string
  end
end
