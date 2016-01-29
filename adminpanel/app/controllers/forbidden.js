import Ember from 'ember';

export default Ember.Controller.extend({
  currentUser: Ember.inject.service(),
  actions: {
    logOut(){
      this.get('currentUser').invalidate().then(
        function(){
          window.location.replace('/admin_panel');
        });
    }
  }
});
