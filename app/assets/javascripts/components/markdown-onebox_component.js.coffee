# for more details see: http://emberjs.com/guides/components/

YFHS.MarkdownOneboxComponent = Ember.Component.extend({
  oneBox: Ember.inject.service()
  didInsertElement: ()->
    id = '#' + @get('elementId')
    if @get 'placeholder'
      Ember.observer 'text', ()->
        @.get('oneBox').placeholder id
    else
      @get('oneBox').preview id
})
