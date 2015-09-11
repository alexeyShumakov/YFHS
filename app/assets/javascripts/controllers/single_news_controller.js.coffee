# for more details see: http://emberjs.com/guides/controllers/

YFHS.SingleNewsController = Ember.Controller.extend({
  comment: ''
  oneBox: Ember.inject.service()
  replaceLinks: Ember.observer 'comment', ()->
    @.get('oneBox').placeholder('.comment-preview')

  actions:
    saveComment: ()->
      _this = @
      comment = @.store.createRecord 'comment'
      user = @.get 'currentUser.user'
      news = @.get 'model'
      body = @.get 'comment'
      comment.set 'user', user
      comment.set 'news', news
      comment.set 'body', body
      comment.save().then(
        ()->
          _this.set 'comment', ''
      )
})

