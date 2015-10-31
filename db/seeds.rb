require 'faraday'
require 'json'
Card.delete_all

conn =  Faraday.new(url: 'https://omgvamp-hearthstone-v1.p.mashape.com')
response = conn.get do |req|
  req.url '/cards'
  req.headers['X-Mashape-Key'] = 'QFoPqBzZPBmshJ2Pq9hptKbD5WX0p18oBYFjsnLkliETS6QyN7'
  req.params['locale'] = 'ruRU'
end

response_json = JSON.parse response.body

response_json.each do |_, value|
  value.each do |card|

    if card.key? 'collectible'
      if card['collectible']
        if card.key? 'img'
          card_model = Card.new
          card_model.name = card['name']
          card_model.card_set = card['cardSet']
          card_model.card_type = card['type']
          card_model.rarity = card['rarity']
          card_model.attack = card['attack']
          card_model.cost = card['cost']
          card_model.health = card['health']
          card_model.collectible = card['collectible']
          card_model.player_class_str = card['playerClass']
          card_model.img = URI.parse(card['img'])
          card_model.img_gold = URI.parse(card['imgGold'])
          puts card['name']
          card_model.save
        end
      end
    end
  end
end

player_classes = {
  Priest: 'Жрец',
  Rogue: 'Разбойница',
  Warrior: 'Воин',
  Warlock: 'Чернокнижник',
  Mage: 'Маг',
  Druid: 'Друид',
  Hunter: 'Охотник',
  Shaman: 'Шаман',
  Paladin: 'Паладин'
}
%w(aggro mid-range combo control).each do |d_type|
  DeckType.create( name: d_type )
end
player_classes.each do |key, value|
  new_pc = PlayerClass.create
  new_pc.name = value
  new_pc.en_name = key
  new_pc.save
  pc_cards = Card.where player_class_str: key
  pc_cards.each do |card|
    card.player_class = new_pc
    card.save
  end

  user = User.create email: 'test@mail.com', password: 'password', password_confirmation: 'password', confirmed_at: Date.today
  deck_type = DeckType.first
  player_class = PlayerClass.first
  cards = Card.where(player_class: player_class).last 30
  100.times do
    deck = Deck.create player_class: player_class, name: 'Моя колода', description: 'Описание', user: user, deck_type: deck_type
    cards.each do |card|
      builder_card = BuilderCard.create deck: deck, card: card, count: 1
      deck.builder_cards << builder_card
    end
    deck.save
  end
end