require 'rest-client'
require 'json'

class << self
  def get_img(url, card, gold)
    begin
      img = RestClient.get(url)
      img_path = Rails.root.join('tmp/temp_img.png')
      File.open(img_path, 'wb') { |f| f.write(img)}
      tmp_file = File.open img_path
      if gold
        card.img_gold = tmp_file
      else
        card.img = tmp_file
      end
      tmp_file.close
    rescue Exception => e
      puts 'not found, 404'
    end
  end
end

cards = RestClient::Request.execute(
  method: :get,
  url: 'https://omgvamp-hearthstone-v1.p.mashape.com/cards',
  headers: {
    params: {locale: 'ruRU'},
    'X-Mashape-Key' => 'QFoPqBzZPBmshJ2Pq9hptKbD5WX0p18oBYFjsnLkliETS6QyN7'
  }
)
response_json = JSON.parse cards

response_json.each do |_, value|
  value.each do |card|

    if card.key? 'collectible'
      if card['collectible']
        if card.key? 'img'
          card_model = Card.new
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
          get_img(card['imgGold'], card_model, true)
          get_img(card['img'], card_model, false)
          puts card['name']
          card_model.save
        end
      end
    end
  end
end

