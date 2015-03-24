class AddAccessIdToMemorabilia < ActiveRecord::Migration
  def change
    add_column :memorabilia, :access_id, :string
  end
end
