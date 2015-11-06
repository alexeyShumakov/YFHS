# For more information see: http://emberjs.com/guides/routing/
YFHS.Router.reopen
  location: 'history'

YFHS.Router.map ()->
  @route 'cards'
  @route 'card', path: 'cards/:id'
  @route 'deck', path: 'decks/:id'
  @route 'deck_edit', path: 'decks/:id/edit'
  @route 'decks', ()->
    @route 'search'
  @route 'builder', ()->
    @route 'deck'
    @route 'player_class', path: 'd/:id'
    @route 'synergy'

  @route('single_news', path: 'news/:news_id')
  @route('news', ()->
    @route('new')
  )
