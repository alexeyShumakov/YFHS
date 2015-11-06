# for more details see: http://emberjs.com/guides/components/

YFHS.SearchCardsComponent = Ember.Component.extend({
  store: Ember.inject.service()
  currentPage: 1
  cost: null
  keyword: null
  isLoading: false
  search: ()->
    unless @get 'isLoading'
      _this = @
      params = @get 'qParams'
      @set 'isLoading', true
      @get('store').query('card', params).then(
        (cards)->
          _this.set('cards', cards)
          _this.set 'isLoading', false
      )

  didInsertElement: ()->
    Ember.run.debounce(@, @.search, 100)

  qParams: Ember.computed 'currentPage', 'cost', 'keyword', 'playerClass', ()->
    {
      page: @get 'currentPage'
      cost: @get 'cost'
      keyword: @get 'keyword'
      player_class: @get 'playerClass'
      current_player_class: @get 'currentPlayerClass'
    }
  setCards: Ember.observer 'keyword', 'currentPage', 'cost', 'playerClass', ()->
    Ember.run.debounce(@, @.search, 100)

  pageResetter: Ember.observer 'keyword', 'cost', 'playerClass', ()->
    @set 'currentPage', 1

  actions:
    nextSlide: ()->
      unless Ember.isEqual(@get('cards.meta.total'), @get('currentPage') )
        @incrementProperty('currentPage')
    prevSlide: ()->
      unless Ember.isEqual(@get('currentPage'), 1 )
        @decrementProperty('currentPage')

    updateCost: (value)->
      @set 'cost', value

    updatePlayerClass: (value)->
      @set 'playerClass', value
    clickCard: (card)->
      @sendAction('action', card)
})

