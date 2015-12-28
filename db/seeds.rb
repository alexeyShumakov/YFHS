require 'faraday'
require 'json'
require 'net/http'

def get_img(url_obj)
  Net::HTTP.start(url_obj.host, url_obj.port) do |http|
    if http.head(url_obj.request_uri).code == '200'
      url_obj
    end
  end
rescue
  nil
end

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
          card_model.img_gold = get_img(URI.parse(card['imgGold']))
          card_model.card_game_id = card['cardId']
          card_model.name = card['name']
          card_model.card_set = card['cardSet']
          card_model.durability = card['durability']
          card_model.card_type = card['type']
          card_model.race = card['race']
          card_model.player_class_str = card['playerClass']
          card_model.faction = card['faction']
          card_model.rarity = card['rarity']
          card_model.cost = card['cost']
          card_model.attack = card['attack']
          card_model.health = card['health']
          card_model.text = card['text']
          card_model.flavor = card['flavor']
          card_model.artist = card['artist']
          card_model.collectible = card['collectible']
          card_model.elite = card['elite']
          card_model.locale = card['locale']
          card_model.mechanics = card['mechanics']
          card_model.img = get_img(URI.parse(card['img']))
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
end
User.create(public_nickname: 'iAmUser', email: 'test@mail.com', password: 'password', password_confirmation: 'password', confirmed_at: Date.today)
User.create(public_nickname: 'iAmUser1', email: 'test1@mail.com', password: 'password', password_confirmation: 'password', confirmed_at: Date.today)
User.create(public_nickname: 'admin', email: 'admin@mail.com', role: 2, password: 'password', password_confirmation: 'password', confirmed_at: Date.today)
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
%w(trumpsc hero_firebat kolento strifecro lifecoach1981 gaarabestshaman MaSsanSC Eligorko
  amazhs neirea thijsHS hsdogdog reynad27 savjz noxious_hs nl_kripp superjj102 Zetalot
  kucha044 silvername abver gnumme).each {|streamer_name| strm = TwitchStream.new streamer_name: streamer_name; strm.save  }
TwitchStream.refresh
