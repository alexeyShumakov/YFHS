# For more information see: http://emberjs.com/guides/routing/
YFHS.Router.reopen
  location: 'history'

YFHS.Router.map ()->
  @route 'user', path: 'users/:id', ()->
    @route 'decks'
    @route 'comments'
    @route 'synergies'

  @route 'cards'
  @route 'card', path: 'cards/:id'

  @route 'synergy', path: 'synergies/:id'
  @route 'synergy_edit', path: 'synergies/:id/edit'
  @route 'synergies', ()->
    @route 'search'

  @route 'deck', path: 'decks/:id'
  @route 'deck_edit', path: 'decks/:id/edit'
  @route 'decks', ()->
    @route 'search'

  @route 'builder', ()->
    @route 'deck', path: 'deck/:id'
    @route 'synergy', path: 'synergy/:id'

  @route 'news', path: 'news/:id'
  @route 'news_index', path: 'news', ()->
    @route('new')
