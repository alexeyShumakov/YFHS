import Ember from 'ember';

export default Ember.Controller.extend({
  currentUser: Ember.inject.service(),
  actions: {
    logIn(){
      this.set('currentUser.password', this.get('password'));
      this.set('currentUser.email', this.get('email'));
      let _this = this;
      this.get('currentUser').authenticate().then(
        function () {
          _this.set('currentUser.isLogInError', false);
          window.location.replace('/admin_panel');
        }, function (data) {
          _this.set('currentUser.logInError', data.error);
          _this.set('currentUser.isLogInError', true);
        });
    }
  }
});
