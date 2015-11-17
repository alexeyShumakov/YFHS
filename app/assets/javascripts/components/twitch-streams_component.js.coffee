# for more details see: http://emberjs.com/guides/components/

YFHS.TwitchStreamsComponent = Ember.Component.extend({
  classNames: ['margin-bottom']
  sliced: true
  sort: ['viewers:desc']
  sortedStreams: Ember.computed.sort 'streams', 'sort'
  filterStreams: Ember.computed 'streams', 'sliced', ()->
    arr = @get('sortedStreams').filter (stream)->
      stream.get('viewers') != 0
    if @get('sliced')
      arr.slice(0, 5)
    else
      arr
  actions:
    showAll: ()->
      @toggleProperty 'sliced'
})

