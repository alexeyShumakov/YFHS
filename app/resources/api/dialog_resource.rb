class Api::DialogResource < BaseResource
  attributes :unread
  has_many :dialogs_messages
  has_one :owner, class_name: 'User', foreign_key: 'owner_id'
  has_one :company, class_name: 'User', foreign_key: 'company_id'

  has_one :duplicate, class_name: 'Dialog', foreign_key: 'duplicate_id'
  filter :owner, :id
end
