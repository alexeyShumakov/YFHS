# for more details see: http://emberjs.com/guides/controllers/

YFHS.NewsNewController = Ember.Controller.extend
  oneBox: Ember.inject.service()
  replaceLinks: Ember.observer 'model.body', ()->
    @.get('oneBox').placeholder('.news-preview')

  actions:
    save: ()->
      _this = @
      @.get('model').save().then(
        ()->
          newModel = _this.store.createRecord 'news'
          _this.set 'model', newModel
      )

