class Card < ActiveRecord::Base
  belongs_to :deck
  belongs_to :player_class
  has_attached_file :img
  validates_attachment_content_type :img, content_type: /\Aimage\/.*\Z/

  has_attached_file :img_gold
  validates_attachment_content_type :img_gold, content_type: /\Aimage\/.*\Z/
end
