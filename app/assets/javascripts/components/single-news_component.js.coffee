# for more details see: http://emberjs.com/guides/components/

YFHS.SingleNewsComponent = Ember.Component.extend
  oneBox: Ember.inject.service()
  didInsertElement: ()->
    id = '#' + @.get('elementId')
    @.get('oneBox').preview(id)
  actions:
    delete: ()->
      @.get('news').destroyRecord()


