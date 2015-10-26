class RemoveFieldsFromCards < ActiveRecord::Migration
  def change
    remove_column :cards, :card_game_id
    remove_column :cards, :durability
    remove_column :cards, :race
    remove_column :cards, :faction
    remove_column :cards, :text
    remove_column :cards, :flavor
    remove_column :cards, :artist
    remove_column :cards, :elite
    remove_column :cards, :locale
    remove_column :cards, :mechanics
  end
end
