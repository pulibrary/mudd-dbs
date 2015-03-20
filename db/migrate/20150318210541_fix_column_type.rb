class FixColumnType < ActiveRecord::Migration
  def change
    rename_column :memorials, :type, :article_type
  end
end
