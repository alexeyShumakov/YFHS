# for more details see: http://emberjs.com/guides/components/

YFHS.ListClassesComponent = Ember.Component.extend
  classNames: ['class-list', 'nav', 'nav-pills', 'nav-justified']
  tagName: 'ul'

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

