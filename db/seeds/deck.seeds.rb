after :user, :deck_type, :player_class, :card do
  user = User.first
  deck_type = DeckType.first
  player_class = PlayerClass.first
  cards = Card.where.not(cost: nil).where(player_class: player_class).last 30
  100.times do
    deck = Deck.create player_class: player_class, name: 'Моя колода', description: 'Описание', user: user, deck_type: deck_type
    cards.each do |card|
      builder_card = BuilderCard.create deck: deck, card: card, count: 1
      deck.builder_cards << builder_card
    end
    deck.save
  end
end
