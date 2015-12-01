import Ember from 'ember';

export default Ember.Service.extend({
  session: Ember.inject.service(),
  email: '',
  password: '',
  passwordConfirmation: '',
  logInError: '',
  isLogInError: false,
  isLogIn: Ember.computed.alias('session.isAuthenticated'),
  loading: true,
  user: Ember.computed('session.session.content.authenticated.data.id', function(){
    return this.get('session.session.content.authenticated.data');
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
