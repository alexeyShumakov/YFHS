class CreateSynergiesCards < ActiveRecord::Migration
  def change
    create_table :synergies_cards do |t|
      t.references :synergy, index: true, foreign_key: true
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
