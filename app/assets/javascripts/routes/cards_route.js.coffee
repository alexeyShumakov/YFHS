# For more information see: http://emberjs.com/guides/routing/

YFHS.CardsRoute = Ember.Route.extend
  model: ()->
    Ember.RSVP.hash
      cards: @.store.findAll 'card'
      classes: @.store.findAll 'player_class'
  afterModel: (model)->

  setupController: (controller, model)->
    @._super controller, model
    tabs = Ember.A()
    costs = Ember.A()
    nums = [1,2,3,4,5,6]
    YFHS.Cost = Ember.Object.extend
      value: ''
      valueStr: ''
      isActive: 'false'
    nums.forEach (num)->
      costs.pushObject YFHS.Cost.create
        value: num
        isActive: false
        valueStr: num
    costs.pushObject YFHS.Cost.create
        value: 7
        isActive: false
        valueStr: '7+'
    YFHS.Tab = Ember.Object.extend
      name: ''
      en_name: ''
      isShow: true
      isActive: false

    tabs.pushObject YFHS.Tab.create
      name: 'Нейтральные'
      en_name: 'Neutral'
      isShow: true
      isActive: true
    model.classes.forEach (model)->
      tabs.pushObject YFHS.Tab.create
        name: model.get 'name'
        en_name: model.get 'en_name'
        isShow: true
        isActive: false
    @.controller.set 'playerClass', 'Neutral'
    @.controller.set 'cost', null
    @.controller.set 'tabs', tabs
    @.controller.set 'costs', costs

  actions:
    tabToggle: ()->
