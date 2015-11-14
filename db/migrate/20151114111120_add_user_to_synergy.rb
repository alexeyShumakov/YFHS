class AddUserToSynergy < ActiveRecord::Migration
  def change
    add_reference :synergies, :user, index: true, foreign_key: true
  end
end
