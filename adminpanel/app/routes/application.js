import Ember from 'ember';

export default Ember.Route.extend({
  currentUser: Ember.inject.service(),
  beforeModel(){
    return this.get('currentUser').setCurrentUser();
  },
  model(){
    let user = this.get('currentUser.user');
    if (Ember.isPresent(user)){
      if (!user.admin()) {
        this.transitionTo('forbidden');
      }
    } else {
      this.transitionTo('login');
    }
  }
});
