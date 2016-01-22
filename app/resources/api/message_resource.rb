class Api::MessageResource < BaseResource
  after_create :update_models
  after_update :checked_message
  attributes :unread, :body, :created_at
  has_one :user
  has_many :dialogs_messages
  has_one :target, foreign_key: 'target_user_id', class_name: 'User'
  filter :id

  private
    def checked_message
      c_u = @context[:current_user]
      dialog = Dialog.where(owner: @model.user, company: c_u).first
      if dialog.present?
        dialog.duplicate.update_unread
        unless @model.unread
          Notifier.notify c_u.id, { totalUnreadMessages: c_u.total_unread_messages }
          MessageBus.publish "/dialogs/#{dialog.id}", { checkedMessageId: @model.id }.to_json
        end
      end

    end
    def update_models
      c_u = @context[:current_user]

      if c_u != @model.target
        current_users_dialog = Dialog.where(company: @model.target, owner: c_u).first_or_create
        companies_dialog = Dialog.where(company: c_u, owner: @model.target).first_or_create

        current_users_dialog.duplicate = companies_dialog
        current_users_dialog.save

        companies_dialog.duplicate = current_users_dialog
        companies_dialog.update_unread
        companies_dialog.save
        DialogsMessage.where(message: @model, dialog: current_users_dialog).first_or_create
        dialog_message = DialogsMessage.create(message: @model, dialog: companies_dialog)

        event = {
            totalUnreadMessages: @model.target.total_unread_messages,
            publicNickname: @model.user.public_nickname,
            text: 'оставил вам личное',
            entity: {
                route: 'dialog',
                id: companies_dialog.id,
                name: 'сообщение'
            }
        }
        Notifier.notify(@model.target.id, event)
        MessageBus.publish "/dialogs/#{companies_dialog.id}", { dialogsMessageId: dialog_message.id }.to_json
        MessageBus.publish "/dialogs-list/#{@model.target.id}", { id: companies_dialog.id }.to_json

      end
    end
end
