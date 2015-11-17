# for more details see: http://emberjs.com/guides/components/

YFHS.TwitchStreamsComponent = Ember.Component.extend({
  classNames: ['margin-bottom']
  filterStreams: Ember.computed 'streams', ()->
    @get('streams').filter (stream)->
      stream.get('viewers') != 0
})

