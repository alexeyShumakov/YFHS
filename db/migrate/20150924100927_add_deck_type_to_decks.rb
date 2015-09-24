class AddDeckTypeToDecks < ActiveRecord::Migration
  def change
    remove_column :decks, :deck_type
    add_reference :decks, :deck_type, index: true, foreign_key: true
  end
end
