class Api::MessageResource < BaseResource
  after_save :update_models
  attributes :unread, :body, :created_at
  has_one :user
  has_many :dialogs_messages
  has_one :target, foreign_key: 'target_user_id', class_name: 'User'

  private
    def update_models
      c_u = @context[:current_user]

      dialog_1 = Dialog.where(company: @model.target, owner: c_u).first_or_create
      dialog_2 = Dialog.where(company: c_u, owner: @model.target).first_or_create

      dialog_1.duplicate = dialog_2
      dialog_1.save

      dialog_2.duplicate = dialog_1
      dialog_2.save
      DialogsMessage.create(message: @model, dialog: dialog_2)
    end
end
