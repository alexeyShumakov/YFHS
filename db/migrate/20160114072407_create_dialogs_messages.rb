class CreateDialogsMessages < ActiveRecord::Migration
  def change
    create_table :dialogs_messages do |t|
      t.references :dialog, index: true
      t.references :message, index: true
    end
  end
end
