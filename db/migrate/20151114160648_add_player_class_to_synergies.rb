class AddPlayerClassToSynergies < ActiveRecord::Migration
  def change
    add_reference :synergies, :player_class, index: true, foreign_key: true
  end
end
