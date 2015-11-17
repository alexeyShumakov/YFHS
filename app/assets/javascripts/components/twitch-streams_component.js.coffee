# for more details see: http://emberjs.com/guides/components/

YFHS.TwitchStreamsComponent = Ember.Component.extend({
  classNames: ['margin-bottom']
  sliced: true
  showMore: Ember.computed 'streams', ()->
    @get('streams.length') > 5
  sort: ['viewers:desc']
  sortedStreams: Ember.computed.sort 'streams', 'sort'
  filterStreams: Ember.computed 'streams', 'sliced', ()->
    arr = @get('sortedStreams')
    if @get('sliced')
      arr.slice(0, 5)
    else
      arr
  actions:
    showAll: ()->
      @toggleProperty 'sliced'
})

