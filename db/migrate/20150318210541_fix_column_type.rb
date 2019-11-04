class FixColumnType < ActiveRecord::Migration[5.2]
  def change
    rename_column :memorials, :type, :article_type
  end
end
