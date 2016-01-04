
after :card do
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
end
