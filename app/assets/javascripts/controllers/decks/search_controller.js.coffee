# for more details see: http://emberjs.com/guides/controllers/

YFHS.DecksSearchController = Ember.Controller.extend({
  queryParams: ['player_class', 'deck_type', 'name']
  player_class: null
  deck_type: null
  name: null

  clearProp: ()->
    @.setProperties
      player_class: null
      deck_type: null
      name: null

})

