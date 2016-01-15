class CreateDialogs < ActiveRecord::Migration
  def change
    create_table :dialogs do |t|
      t.integer :owner_id, index: true
      t.integer :company_id, index: true
      t.integer :duplicate_id, index: true
      t.timestamps null: false
      t.boolean :unread, default: true
    end
  end
end
