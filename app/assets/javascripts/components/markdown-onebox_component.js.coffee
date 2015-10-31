# for more details see: http://emberjs.com/guides/components/

YFHS.MarkdownOneboxComponent = Ember.Component.extend({
  oneBox: Ember.inject.service()
  didInsertElement: ()->
    unless @get 'placeholder'
      @get('oneBox').preview @getId()

  getId: ()->
    '#' + @get('elementId')

  obs: Ember.observer 'text', ()->
    if @get 'placeholder'
      @get('oneBox').placeholder @getId()

})
