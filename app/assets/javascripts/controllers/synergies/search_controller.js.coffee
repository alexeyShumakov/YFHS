# for more details see: http://emberjs.com/guides/controllers/

YFHS.SynergiesSearchController = Ember.Controller.extend({
  queryParams: ['player_class', 'name']
  player_class: null
  name: null

  clearProp: ()->
    @.setProperties
      player_class: null
      name: null

})

