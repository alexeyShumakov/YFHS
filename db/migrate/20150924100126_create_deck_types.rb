class CreateDeckTypes < ActiveRecord::Migration
  def change
    create_table :deck_types do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
