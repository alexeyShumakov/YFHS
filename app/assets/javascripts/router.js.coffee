# For more information see: http://emberjs.com/guides/routing/
YFHS.Router.reopen
  location: 'history'

YFHS.Router.map ()->
   @.route('news', ()->
     @.route('new')
   )

