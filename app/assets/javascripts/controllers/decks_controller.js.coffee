# for more details see: http://emberjs.com/guides/controllers/

YFHS.DecksController = Ember.Controller.extend({
  actions:
    nameSearch: (name)->
      if Ember.isEmpty name
        name = null
      @transitionToRoute 'decks.search', {queryParams: {name: name}}
  clearProp: ()->
    @setProperties
      nameText: null
})

