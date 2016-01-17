class Api::DialogsMessageResource < BaseResource
  attributes :created_at
  has_one :dialog
  has_one :message
  filters :id, :dialog, :message
  paginator :offset
end
