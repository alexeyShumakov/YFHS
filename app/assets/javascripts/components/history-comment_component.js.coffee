# for more details see: http://emberjs.com/guides/components/

YFHS.HistoryCommentComponent = Ember.Component.extend({
  commentable: Ember.computed ()->
    @get('comment.commentable_type').toLowerCase()


  link: Ember.computed ()->
    type = @get 'commentable'
    id = @get 'comment.commentable_id'
    "/#{type}/#{id}"
  actions:
    goToEntity: ()->
      type = @get 'commentable'
      id = @get 'comment.commentable_id'
      @sendAction('action', id, type)


})

