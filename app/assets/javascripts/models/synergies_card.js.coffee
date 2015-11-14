# for more details see: http://emberjs.com/guides/models/defining-models/

YFHS.SynergiesCard = DS.Model.extend
  card: DS.belongsTo 'card'
  synergy: DS.belongsTo 'synergy'
  disableCard: ()->
    @set 'card.isActive', false
  enableCard: ()->
    @set 'card.isActive', true
