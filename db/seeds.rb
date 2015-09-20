require 'faraday'
require 'json'
Card.all.each do |card|
  card.player_class = nil
  card.save
end
PlayerClass.delete_all
# Card.delete_all
# conn =  Faraday.new(url: 'https://omgvamp-hearthstone-v1.p.mashape.com')
# response = conn.get do |req|
#   req.url '/cards'
#   req.headers['X-Mashape-Key'] = 'QFoPqBzZPBmshJ2Pq9hptKbD5WX0p18oBYFjsnLkliETS6QyN7'
#   req.params['locale'] = 'ruRU'
# end
# response_json = JSON.parse response.body
#
# response_json.each do |_, value|
#   value.each do |card|
#
#     if card.key? 'collectible'
#       if card['collectible']
#         if card.key? 'img'
#           card_model = Card.new
#           card_model.card_game_id = card['cardId']
#           card_model.name = card['name']
#           card_model.card_set = card['cardSet']
#           card_model.type = card['type']
#           card_model.faction = card['faction']
#           card_model.rarity = card['rarity']
#           card_model.attack = card['attack']
#           card_model.cost = card['cost']
#           card_model.health = card['health']
#           card_model.durability = card['durability']
#           card_model.text = card['text']
#           card_model.flavor = card['flavor']
#           card_model.artist = card['artist']
#           card_model.collectible = card['collectible']
#           card_model.elite = card['elite']
#           card_model.race = card['race']
#           card_model.player_class = card['playerClass']
#           card_model.locale = card['locale']
#           card_model.mechanics = card['mechanics']
#           card_model.img = URI.parse(card['img'])
#           card_model.img_gold = URI.parse(card['imgGold'])
#           puts card['name']
#           card_model.save
#         end
#       end
#     end
#   end
# end

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