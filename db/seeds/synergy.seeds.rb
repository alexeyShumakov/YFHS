after :user, :player_class, :card do
  user = User.first
  player_class = PlayerClass.first
  cards = Card.where.not(cost: nil).where(player_class: player_class).last 3
  100.times do
    synergy = Synergy.create player_class: player_class, name: 'Моя synergy', description: 'Описание', user: user
    cards.each do |card|
      synergy_card = SynergyCard.create synergy: synergy, card: card
      synergy.synergy_cards << synergy_card
    end
    synergy.save
  end
end
