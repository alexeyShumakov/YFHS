# for more details see: http://emberjs.com/guides/controllers/

YFHS.DecksController = Ember.Controller.extend({
  search: ()->
    name = @get 'nameText'
    if Ember.isEmpty name
      name = null
    @transitionToRoute 'decks.search', {queryParams: {name: name}}
  actions:
    nameSearch: (name)->
      Ember.run.debounce @, @search, 300
  clearProp: ()->
    @setProperties
      nameText: null
})

