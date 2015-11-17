class CreateTwitchStreams < ActiveRecord::Migration
  def change
    create_table :twitch_streams do |t|
      t.string :streamer_name
      t.string :avatar
      t.integer :viewers
      t.boolean :online

      t.timestamps null: false
    end
  end
end
