# for more details see: http://emberjs.com/guides/components/

YFHS.MarkdownOneboxComponent = Ember.Component.extend({
  oneBox: Ember.inject.service()
  didInsertElement: ()->
    id = '#' + @get('elementId')
    @get('oneBox').preview(id)
})
