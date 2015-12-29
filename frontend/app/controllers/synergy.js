import Ember from 'ember';

export default Ember.Controller.extend({
  canEdit: Ember.computed('model', function(){
    if (this.get('currentUser.isLogIn')) {
      return this.get('currentUser.user.isAdmin') || this.get('currentUser.user').isAuthor(this.get('model'));
    } else { return false }
  }),
  actions:{
    removeSynergy(){
      this.get('model').destroyRecord()
    }
  }
});
