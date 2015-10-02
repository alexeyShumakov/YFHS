# for more details see: http://emberjs.com/guides/components/

YFHS.ManaCurveItemComponent = Ember.Component.extend
  classNames: ['curve-item']
  itemHeight: Ember.computed 'unitSize', 'totalCount', ()->
    height = @.get('totalCount') * @.get('unitSize')
    ("height: #{height}%").htmlSafe()
  totalCount: Ember.computed 'deck.totalCards', ()->
    cost = @.get 'manaItem.cost'
    count = 0
    @.get('deck.cards').forEach (item)->
      if Ember.isEqual cost, 7
        if item.get('card.cost') >= 7
          count += item.get 'count'
      else
        if Ember.isEqual item.get('card.cost'), cost
          count += item.get 'count'
    @.set 'manaItem.count', count
    count

