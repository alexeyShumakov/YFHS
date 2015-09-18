class CreateCards < ActiveRecord::Migration
  def change
    create_table :cards do |t|
      t.string :card_game_id
      t.string :name
      t.string :card_set
      t.integer :durability
      t.string :type
      t.string :race
      t.string :player_class
      t.string :faction
      t.string :rarity
      t.integer :cost
      t.integer :attack
      t.integer :health
      t.string :text
      t.string :flavor
      t.string :artist
      t.boolean :collectible
      t.boolean :elite
      t.string :locale
      t.json :mechanics

      t.timestamps null: false
    end
  end
end
