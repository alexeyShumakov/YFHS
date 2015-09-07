# for more details see: http://emberjs.com/guides/controllers/

YFHS.NewsNewController = Ember.Controller.extend
  oneBox: Ember.inject.service 'one-box'
  markdown: '#hello Alexey'
  replaceLinks: Ember.observer 'markdown', ()->
    @.get('oneBox').replaceLinks()

