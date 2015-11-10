# for more details see: http://emberjs.com/guides/components/

YFHS.ManaCurveComponent = Ember.Component.extend
  classNames: ['mana-curve', 'well']
  mana: [
    Ember.Object.create({cost: 0, name: 0, count: 0 }),
    Ember.Object.create({cost: 1, name: 1, count: 0 }),
    Ember.Object.create({cost: 2, name: 2, count: 0 }),
    Ember.Object.create({cost: 3, name: 3, count: 0 }),
    Ember.Object.create({cost: 4, name: 4, count: 0 }),
    Ember.Object.create({cost: 5, name: 5, count: 0 }),
    Ember.Object.create({cost: 6, name: 6, count: 0 }),
    Ember.Object.create({cost: 7, name: '7+', count: 0 })
  ]
  countMap: Ember.computed.mapBy 'mana', 'count'
  maxCount: Ember.computed.max 'countMap'
  unitSize: Ember.computed 'mana.count', ()->
    12.5 if @.get('maxCount') <= 8 or 100/@.get('maxCount')

