# for more details see: http://emberjs.com/guides/controllers/

YFHS.NewsNewController = Ember.Controller.extend
  actions:
    save: ()->
      _this = @
      @.set 'model.user', @.get('currentUser.user')
      @.get('model').save().then(
        ()->
          _this.send 'newModel'
      )

