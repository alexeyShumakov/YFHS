class AddCommentCountToDeck < ActiveRecord::Migration
  def change
    add_column :decks, :comments_count, :integer, default: 0
  end
end
