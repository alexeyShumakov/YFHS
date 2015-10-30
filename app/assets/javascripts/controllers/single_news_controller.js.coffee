# for more details see: http://emberjs.com/guides/controllers/

YFHS.SingleNewsController = Ember.Controller.extend({
  comment: ''
  oneBox: Ember.inject.service()
  replaceLinks: Ember.observer 'comment', ()->
    @.get('oneBox').placeholder('.comment-preview')

  actions:
    saveComment: ()->
      unless Ember.isBlank @get('comment')
        _this = @
        comment = @.store.createRecord 'comment'
        comment.setProperties
          user: @.get 'currentUser.user'
          news: @.get 'model'
          body: @.get 'comment'
        comment.save().then(
          ()->
            _this.set 'comment', ''
        )
})

