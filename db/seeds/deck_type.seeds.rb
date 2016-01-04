%w(aggro mid-range combo control).each do |d_type|
  DeckType.create( name: d_type )
end
