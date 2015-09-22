# For more information see: http://emberjs.com/guides/routing/

YFHS.CardsRoute = Ember.Route.extend
  model: ()->
    Ember.RSVP.hash
      cards: @.store.findAll 'card'
  setupController: (controller, model)->
    @._super controller, model
    playerClasses = Ember.A([
        Ember.Object.create {title: 'Нейтральные', name: 'Neutral', isActive: false}
        Ember.Object.create {title: 'Друид', name: 'Druid', isActive: false}
        Ember.Object.create {title: 'Жрец', name: 'Priest', isActive: false}
        Ember.Object.create {title: 'Охотник', name: 'Hunter', isActive: false}
        Ember.Object.create {title: 'Разбойница', name: 'Rogue', isActive: false}
        Ember.Object.create {title: 'Воин', name: 'Warrior', isActive: false}
        Ember.Object.create {title: 'Чернокнижник', name: 'Warlock', isActive: false}
        Ember.Object.create {title: 'Маг', name: 'Mage', isActive: false}
        Ember.Object.create {title: 'Шаман', name: 'Shaman', isActive: false}
        Ember.Object.create {title: 'Паладин', name: 'Paladin', isActive: false}
      ])
    controller.set 'playerClasses', playerClasses
    controller.set 'playerClass', null
    controller.set 'cost', null
    controller.set 'keyword', null
