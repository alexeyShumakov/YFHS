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
      dialog = @model.target.company_dialogs.where(company: c_u).first
      dialog.duplicate.update_unread
      unless @model.unread
        if dialog.present?
          MessageBus.publish "/dialogs/#{dialog.id}", { checkedMessageId: @model.id}.to_json
        end
      end

    end
    def update_models
      c_u = @context[:current_user]

      if c_u != @model.target
        dialog_1 = Dialog.where(company: @model.target, owner: c_u).first_or_create
        dialog_2 = Dialog.where(company: c_u, owner: @model.target).first_or_create

        dialog_1.duplicate = dialog_2
        dialog_1.save

        dialog_2.duplicate = dialog_1
        dialog_2.update_unread
        dialog_2.save
        DialogsMessage.where(message: @model, dialog: dialog_1).first_or_create
        dialog_message = DialogsMessage.create(message: @model, dialog: dialog_2)
        MessageBus.publish "/dialogs/#{dialog_2.id}", { dialogsMessageId: dialog_message.id}.to_json
      end
    end
end
