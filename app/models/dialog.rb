class Dialog < ActiveRecord::Base
  has_many :dialogs_messages, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :company, class_name: 'User', foreign_key: 'company_id'

  has_one :duplicate, class_name: 'Dialog', foreign_key: 'duplicate_id'
  belongs_to :dup, class_name: 'Dialog', foreign_key:  'duplicate_id'
end
