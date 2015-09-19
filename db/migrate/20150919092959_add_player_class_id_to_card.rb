class AddPlayerClassIdToCard < ActiveRecord::Migration
  def change
    add_reference :cards, :player_class, index: true, foreign_key: true
  end
end
