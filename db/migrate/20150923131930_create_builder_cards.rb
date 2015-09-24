class CreateBuilderCards < ActiveRecord::Migration
  def change
    create_table :builder_cards do |t|
      t.references :card, index: true, foreign_key: true
      t.references :deck, index: true, foreign_key: true
      t.integer :count

      t.timestamps null: false
    end
  end
end
