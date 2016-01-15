class Api::DialogsMessageResource < BaseResource
  has_one :dialog
  has_one :message
  filter :id
end
