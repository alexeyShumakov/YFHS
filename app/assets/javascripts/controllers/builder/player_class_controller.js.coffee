# for more details see: http://emberjs.com/guides/controllers/

YFHS.BuilderPlayerClassController = Ember.Controller.extend
  store: Ember.inject.service()
  dTypes: [
    {id:1, name: 'aggro'},
    {id:2, name: 'control'},
    {id:3, name: 'mid-range'},
    {id:4, name: 'otk'},
  ]
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
    playerClassConst = @.get 'playerClassConst'
    if Ember.isPresent playerClass
      if Ember.isEqual playerClass, 'Neutral'
        cards = cards.filter (card)->
          Ember.isBlank card.get('player_class_str')
      else
        cards = cards.filter (card)->
          Ember.isEqual card.get('player_class_str'), playerClass
    else
      cards = cards.filter (card)->
        (Ember.isBlank card.get('player_class_str')) or (Ember.isEqual card.get('player_class_str'), playerClassConst)

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
    saveDeck: ()->
      @.get('model.deck').save()
    removeFromDeck: (builderCard)->
      @.get('model.deck').removeCard builderCard

    addCardToDeck: (card)->
      deck = @.get 'model.deck'
      unless deck.get('isWhole')
        currentBuilderCard = deck.get('cards').findBy 'card.id', card.get 'id'
        if Ember.isPresent currentBuilderCard
          unless card.get('isLegendary')
            card.set 'isActive', false
            if currentBuilderCard.get('count') < 2
              currentBuilderCard.incrementProperty 'count'
              currentBuilderCard.save()
        else
          deck.pushCard card

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

