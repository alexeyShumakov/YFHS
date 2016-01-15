class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :body
      t.references :user, index: true
      t.integer :target_user_id, index: true
      t.boolean :unread, default: true
      t.timestamps null: false
    end
  end
end
