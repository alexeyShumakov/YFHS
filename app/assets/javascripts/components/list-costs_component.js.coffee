# for more details see: http://emberjs.com/guides/components/

YFHS.ListCostsComponent = Ember.Component.extend
  classNames: ['cost-badge']
  costs: Ember.A([
    Ember.Object.create {value: 0, title: '0', isActive: false}
    Ember.Object.create {value: 1, title: '1', isActive: false}
    Ember.Object.create {value: 2, title: '2', isActive: false}
    Ember.Object.create {value: 3, title: '3', isActive: false}
    Ember.Object.create {value: 4, title: '4', isActive: false}
    Ember.Object.create {value: 5, title: '5', isActive: false}
    Ember.Object.create {value: 6, title: '6', isActive: false}
    Ember.Object.create {value: 7, title: '7+', isActive: false}
  ])
  willDestroyElement: ()->
    @get('costs').forEach (item)->
      item.set 'isActive', false
  actions:
    costToggle: (model, models)->
      if model.get('isActive')
        model.set 'isActive', false
        @.sendAction('action', null)
      else
        models.forEach (model)->
          model.set 'isActive', false
        model.set 'isActive', true
        @.sendAction('action', model.get 'value')
