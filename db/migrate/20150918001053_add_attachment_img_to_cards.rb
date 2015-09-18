class AddAttachmentImgToCards < ActiveRecord::Migration
  def self.up
    change_table :cards do |t|
      t.attachment :img
      t.attachment :img_gold
    end
  end

  def self.down
    remove_attachment :cards, :img
    remove_attachment :cards, :img_gold
  end
end
