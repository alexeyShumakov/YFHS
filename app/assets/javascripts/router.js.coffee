# For more information see: http://emberjs.com/guides/routing/
YFHS.Router.reopen
  location: 'history'

YFHS.Router.map ()->
  @.route('cards')
  @.route('single_news', path: 'news/:news_id')
  @.route('news', ()->
    @.route('new')
  )

