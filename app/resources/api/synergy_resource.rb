class Api::SynergyResource < JSONAPI::Resource
  attributes :name, :description, :created_at,
             :comments_count, :user_id
  has_many :synergy_cards
  has_one :user
  has_one :player_class
  def self.records(options = {})
    @models = _model_class.search_synergies options[:context][:params]
    options[:context][:total_pages] = @models.total_pages
    @models
  end
end