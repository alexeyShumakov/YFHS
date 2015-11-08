class AddCurveToDecks < ActiveRecord::Migration
  def change
    add_column :decks, :curve, :json
  end
end
