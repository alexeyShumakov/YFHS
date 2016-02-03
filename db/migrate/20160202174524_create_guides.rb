class CreateGuides < ActiveRecord::Migration
  def change
    create_table :guides do |t|
      t.integer :comments_count, default: 0
      t.string :name
      t.string :body
      t.integer :guide_category_id, index: true

      t.timestamps null: false
    end
  end
end
