# for more details see: http://emberjs.com/guides/components/

YFHS.SingleNewsComponent = Ember.Component.extend
  actions:
    delete: ()->
      @.get('news').destroyRecord()


