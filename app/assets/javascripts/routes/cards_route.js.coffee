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
    @.controller.set 'tabs', tabs

  actions:
    tabToggle: ()->
