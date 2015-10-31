# for more details see: http://emberjs.com/guides/components/

YFHS.CommentsBlockComponent = Ember.Component.extend({
  store: Ember.inject.service()
  comment: ''
  actions:
    saveComment: ()->
      model = @get('commentable')
      unless Ember.isBlank @get('comment')
        _this = @
        comment = @get('store').createRecord 'comment'
        comment.setProperties
          user: @get 'currentUser.user'
          commentable_type: model.get('constructor.modelName').capitalize()
          commentable_id: model.get 'id'
          body: @get 'comment'
        comment.save().then(
          ()->
            _this.get('comments').pushObject(comment)
            _this.set 'comment', ''
        )
})

