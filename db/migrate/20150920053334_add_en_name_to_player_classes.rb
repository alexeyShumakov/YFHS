class AddEnNameToPlayerClasses < ActiveRecord::Migration
  def change
    add_column :player_classes, :en_name, :string
  end
end
