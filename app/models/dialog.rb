class Dialog < ActiveRecord::Base
  has_many :dialogs_messages, dependent: :destroy
  belongs_to :owner, class_name: 'User', foreign_key: 'owner_id'
  belongs_to :company, class_name: 'User', foreign_key: 'company_id'

  has_one :duplicate, class_name: 'Dialog', foreign_key: 'duplicate_id'
  belongs_to :dup, class_name: 'Dialog', foreign_key:  'duplicate_id'

  def unread_count
    Message.where('unread' => true, user: company, target: owner).length
  end
  def update_unread
    messages = Message.where('unread' => true, user: company, target: owner)
    if messages.present?
      self.unread = true
    else
      self.unread = false
    end
    self.save
  end
end
