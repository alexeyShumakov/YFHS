# for more details see: http://emberjs.com/guides/controllers/

YFHS.CardsController = Ember.Controller.extend({
  currentPage: 0

  currentCardsSliced: Ember.computed 'currentCards', ()->
    currentPage = @.get 'currentPage'
    cards = @.get('currentCards')
    cards.slice(currentPage*6, currentPage*6 + 6)

  pageResetter: Ember.observer 'keyword', 'cost', 'playerClass', ()->
    @.set 'currentPage', 0
  totalPages: Ember.computed 'currentCards', ()->
    len = @.get 'currentCards.length'
    if Ember.isEqual(len % 6, 0)
      Math.floor(len/6 - 1)
    else
      Math.floor len/6

  search: Ember.observer 'model.cards', 'currentPage', 'keyword', 'cost', 'playerClass', ()->
    cards = @.get 'model.cards'
    cards = cards.sortBy 'cost'
    cards = @.costFilter(cards)
    cards = @.keywordFilter(cards)
    cards = @.classFilter(cards)

    cards = cards.filter (card)->
      card.get('card_type') != 'Hero'
    @.set 'currentCards', cards

#  Filters

  classFilter: (cards)->
    playerClass = @.get 'playerClass'
    if Ember.isPresent playerClass
      if Ember.isEqual playerClass, 'Neutral'
        cards = cards.filter (card)->
          Ember.isBlank card.get('player_class_str')
      else
        cards = cards.filter (card)->
          Ember.isEqual card.get('player_class_str'), playerClass
    else
      cards

  costFilter: (cards)->
    cost = @.get 'cost'
    if Ember.isPresent @.get 'cost'
      if Ember.isEqual cost, 7
        cards = cards.filter (card)->
          card.get('cost') >= cost
      else
        cards = cards.filter (card)->
          Ember.isEqual card.get('cost'), cost
    else
      cards

  keywordFilter: (cards)->
    if Ember.isPresent @.get 'keyword'
      keyword = @.get('keyword').toLowerCase()
      cards = cards.filter (card)->
        card.get('name').toLowerCase().indexOf(keyword) != -1
    else
      cards

#  End Filter

  actions:
    nextSlide: ()->
      unless Ember.isEqual(@.get('totalPages'), @.get('currentPage') )
        @.incrementProperty('currentPage')
    prevSlide: ()->
      unless Ember.isEqual(@.get('currentPage'), 0 )
        @.decrementProperty('currentPage')

    updateCost: (value)->
      @.set 'cost', value

    updatePlayerClass: (value)->
      @.set 'playerClass', value
})
