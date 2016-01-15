class DialogsMessage < ActiveRecord::Base
  belongs_to :dialog
  belongs_to :message
end
