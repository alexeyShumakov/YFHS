class CreateSynergyCard < ActiveRecord::Migration
  def change
    create_table :synergy_cards do |t|
      t.references :synergy, index: true, foreign_key: true
      t.references :card, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
