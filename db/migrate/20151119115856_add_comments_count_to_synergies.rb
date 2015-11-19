class AddCommentsCountToSynergies < ActiveRecord::Migration
  def change
    add_column :synergies, :comments_count, :integer, default: 0
  end
end
