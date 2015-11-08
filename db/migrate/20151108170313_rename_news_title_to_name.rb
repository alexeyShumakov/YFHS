class RenameNewsTitleToName < ActiveRecord::Migration
  def change
    rename_column :news, :title, :name
  end
end
