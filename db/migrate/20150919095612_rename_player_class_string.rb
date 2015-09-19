class RenamePlayerClassString < ActiveRecord::Migration
  def change
    rename_column :cards, :player_class, :player_class_str
  end
end
