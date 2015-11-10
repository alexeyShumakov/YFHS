# for more details see: http://emberjs.com/guides/components/

YFHS.ListClassesComponent = Ember.Component.extend
  classNames: ['class-list', 'nav', 'nav-pills', 'nav-justified']
  tagName: 'ul'


  playerClasses: Ember.computed 'tempPlayerClasses', ()->
    classes = @get 'tempPlayerClasses'
    currentPC = @get 'currentPlayerClass'
    if Ember.isBlank currentPC
      classes
    else
      classes.filter (item)->
        item.get('name') == currentPC or item.get('name') == 'Neutral'

  tempPlayerClasses: Ember.A([
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

  willDestroyElement: ()->
    @get('tempPlayerClasses').forEach (item)->
      item.set 'isActive', false

  actions:
    classToggle: (pClass, playerClasses)->
      if pClass.get('isActive')
        pClass.set 'isActive', false
        @.sendAction 'action', null
      else
        playerClasses.forEach (pClass)->
          pClass.set 'isActive', false
        pClass.set 'isActive', true
        @.sendAction 'action', pClass.get('name')

