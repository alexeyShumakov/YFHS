class Message < ActiveRecord::Base
  belongs_to :user
  has_many :dialogs_messages
  belongs_to :target, class_name: 'User', foreign_key: 'target_user_id'
end
