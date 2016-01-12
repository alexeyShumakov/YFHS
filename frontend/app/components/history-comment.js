import Ember from 'ember';

export default Ember.Component.extend({
  commentable: Ember.computed(function(){
    return this.get('comment.commentable_type').toLowerCase();
  }),

  link: Ember.computed(function(){
    let type = this.get('commentable');
    let id = this.get('comment.commentable_id');
    return `/${type}/${id}`;

  }),
  actions:{
    goToEntity(){
      let type = this.get('commentable');
      let id = this.get('comment.commentable_id');
      this.sendAction('action', id, type);
    }
  }
});
