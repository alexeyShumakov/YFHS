# for more details see: http://emberjs.com/guides/components/

YFHS.SynergyItemComponent = Ember.Component.extend({
  isDetailed: false
  actions:
    showDetails: ()->
      @toggleProperty 'isDetailed'
})

