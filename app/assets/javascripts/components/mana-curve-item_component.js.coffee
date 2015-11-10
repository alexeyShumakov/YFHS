# for more details see: http://emberjs.com/guides/components/

YFHS.ManaCurveItemComponent = Ember.Component.extend
  classNames: ['curve-item']
  itemHeight: Ember.computed 'totalCount', ()->
    height = @get('totalCount') * @get('unitSize')
    ("height: #{height}%").htmlSafe()

  totalCount: Ember.computed.sum 'totalCountMap'
  totalCountMap: Ember.computed.mapBy 'costCards', 'count'
  costCards: Ember.computed 'deck.totalCards', ()->
    cost = @get 'manaItem.cost'
    @get('deck.cards').filter (item)->
      itemCost = item.get 'card.cost'
      itemCost >= cost if cost == 7 or itemCost == cost
