import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['margin-bottom'],
  store: Ember.inject.service(),
  commentsLoading: true,
  isHidePre: false,
  uniqComments: Ember.computed.uniq('sortedComments'),
  sortedComments: Ember.computed.sort('comments', function(a,b){
    let aTime = moment(a.get('createdAt'));
    let bTime = moment(b.get('createdAt'));
    if (aTime > bTime){
      return -1;
    } else if (aTime < bTime){
      return 1;
    } else {
      return 0;
    }
  }),

  params: Ember.computed(function(){
    let model = this.get('commentable');
    return {
      commentable_type: model.get('constructor.modelName').capitalize(),
      commentable_id: model.get('id')
    };
  }),

  didInsertElement(){
    let _this = this;
    let model = this.get('commentable');
    let qParams = {
      include: 'user',
      commentable_type: model.get('constructor.modelName').capitalize(),
      commentable_id: model.get('id')
    };
    this.get('store').query('comment', qParams).then(
      function(comments){
        _this.set('comments', comments);
        _this.set('commentsLoading', false);
      }
    )
  },

  comment: '',
  actions: {
    togglePre(){
      this.toggleProperty('isHidePre');
    },
    saveComment(){
      let model = this.get('commentable');
      if(!Ember.isBlank(this.get('comment'))){
        var _this = this;
        let comment = this.get('store').createRecord('comment');
        comment.setProperties({
          user: this.get('currentUser.user'),
          commentable_type: model.get('constructor.modelName').capitalize(),
          commentable_id: model.get('id'),
          body: this.get('comment')
        });
        comment.save().then(
          function(){
            model.reload();
            _this.get('comments.content').pushObject(comment._internalModel);
            _this.set('comment', '');
          });
      }
    }
  }
});
