import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    openModal(name){
      this.render(name, {
        into: 'application',
        outlet: 'modal'
      });
    },
    closeModal() {
      this.disconnectOutlet( {
        outlet: 'modal',
        parentView: 'application'
      });
    }
  }
});
