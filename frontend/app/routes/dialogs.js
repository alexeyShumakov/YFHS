import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(){
    if (!this.get('currentUser.isLogIn')){
      this.transitionTo('application');
    }
  },
  model(params){
    return this.store.query('dialog', {
        include: 'company',
        filter: {
          owner: this.get('currentUser.user.id')
        }
      }
    );
  },
  actions: {
    removeDialog(dialog){
      dialog.destroyRecord();
    }
  }
});
