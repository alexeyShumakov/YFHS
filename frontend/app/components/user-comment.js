import Ember from 'ember';

export default Ember.Component.extend({
  isEdit: false,
  currentUser: Ember.inject.service(),
  canEdit: Ember.computed(function(){
    return this.get('currentUser').canEdit(this.get('comment'));
  }),
  actions: {
    toggleEdit() {
      this.toggleProperty('isEdit');
    },
    saveComment() {
      this.get('comment').save();
      this.set('isEdit', false);
    }
  }
});
