class Api::DialogsMessageResource < BaseResource
  has_one :dialog
  has_one :message
  filters :id, :dialog, :message
end
