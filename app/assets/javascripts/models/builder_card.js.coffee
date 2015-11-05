# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.BuilderCard = DS.Model.extend
  card: DS.belongsTo 'card'
  deck: DS.belongsTo 'deck'
  count: DS.attr 'number'

  disableCard: ()->
    if (@get('count')) > 1 or @get('card.isLegendary')
      @set 'card.isActive', false
  enableCard: ()->
    @set 'card.isActive', true


  showCount: Ember.computed 'count', ()->
    if @.get('count') >= 2
      @.get('count')
    else
      null
