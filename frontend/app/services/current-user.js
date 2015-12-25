import Ember from 'ember';

export default Ember.Service.extend({
  session: Ember.inject.service(),
  store: Ember.inject.service(),
  email: '',
  password: '',
  passwordConfirmation: '',
  logInError: '',
  isLogInError: false,
  isLogIn: Ember.computed.alias('session.isAuthenticated'),
  loading: true,

  setCurrentUser(){
    let userId = this.get('session.session.content.authenticated.data.id');
    var _this = this;
    if (this.get('isLogIn')){
      return this.get('store').findRecord('user', userId).then(
        function (user) {
          _this.set('user', user);
        });
    } else {
      if (Ember.isPresent(this.get('user'))){
        this.get('user').unloadRecord();
      }
    }
  },
  some: Ember.observer('isLogIn', function(){
    this.setCurrentUser();
  }),
  invalidate() {
    this.get('session').invalidate();
  },
  authenticate() {
    let password = this.get('password');
    let identification = this.get('email');
    return this.get('session').authenticate('authenticator:token', identification, password);
  }
});
