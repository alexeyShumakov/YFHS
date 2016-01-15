import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(){
    if (!this.get('currentUser.isLogIn')){
      this.transitionTo('application');
    }
  },
  model(params){
    console.log(this.get('currentUser.user.email'));
    return this.store.query('dialog', {
        include: 'company',
        filter: {
          owner: this.get('currentUser.user.id')
        }
      }
    );
  }
});
