# for more details see: http://emberjs.com/guides/components/

YFHS.ListNewsComponent = Ember.Component.extend
  oneBox: Ember.inject.service 'one-box'
  didInsertElement: ()->
    @.get('oneBox').preview('#news')
