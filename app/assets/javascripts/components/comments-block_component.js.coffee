# for more details see: http://emberjs.com/guides/components/

YFHS.CommentsBlockComponent = Ember.Component.extend({
  classNames: ['margin-bottom']
  store: Ember.inject.service()
  commentsLoading: true
  isHidePre: false
  uniqComments: Ember.computed.uniq 'sortedComments'
  sortedComments: Ember.computed.sort 'comments', (a,b)->
    aTime = moment(a.get 'createdAt')
    bTime = moment(b.get 'createdAt')
    if aTime > bTime
      -1
    else if aTime < bTime
      1
    else
      0

  params: Ember.computed ()->
    model = @get('commentable')
    qParams =
      commentable_type: model.get('constructor.modelName').capitalize()
      commentable_id: model.get 'id'

  didInsertElement: ()->
    _this = @
    model = @get('commentable')
    qParams =
      commentable_type: model.get('constructor.modelName').capitalize()
      commentable_id: model.get 'id'
    @get('store').query('comment', qParams).then(
      (comments)->
        _this.set('comments', comments)
        _this.set('commentsLoading', false)
    )
  comment: ''
  actions:
    togglePre: ()->
      @toggleProperty 'isHidePre'
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
            model.reload()
            _this.get('comments.content').pushObject(comment._internalModel)
            _this.set 'comment', ''
        )
})

