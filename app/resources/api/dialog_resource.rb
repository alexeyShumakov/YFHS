class Api::DialogResource < BaseResource
  before_remove :clear_messages
  attributes :unread, :unread_count
  has_many :dialogs_messages
  has_one :owner, class_name: 'User', foreign_key: 'owner_id'
  has_one :company, class_name: 'User', foreign_key: 'company_id'

  has_one :duplicate, class_name: 'Dialog', foreign_key: 'duplicate_id'
  filter :owner, :id
  
  def clear_messages
    @model.unread = false
    @model.save
    messages = Message.where(user: @model.company, target: current_user, unread: true)
    messages.each do |message|
      message.unread = false
      message.save
    end
  end
end
