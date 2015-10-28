# for more details see: http://emberjs.com/guides/components/

YFHS.DeckCardComponent = Ember.Component.extend
  tagName: 'tr'
  classNames: ['card-list__item']
  imgVisability: false

  mouseX: 0
  mouseY: 0

  imgPosition: Ember.computed 'mouseX', ()->
    position = "top:#{@get('mouseY') - 330}px; left:#{@get('mouseX') + 15}px;"
    Ember.String.htmlSafe position
  click: ()->
    @sendAction 'action', @get('card')
  mouseMove: (event)->
    @set 'mouseX', event.clientX
    @set 'mouseY', event.clientY
  mouseEnter: ()->
    @set 'imgVisability', true

  mouseLeave: ()->
    @set 'imgVisability', false

