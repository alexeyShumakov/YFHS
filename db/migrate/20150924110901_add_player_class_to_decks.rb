class AddPlayerClassToDecks < ActiveRecord::Migration
  def change
    add_reference :decks, :player_class, index: true, foreign_key: true
  end
end
