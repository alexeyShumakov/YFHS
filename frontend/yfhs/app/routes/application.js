import Ember from 'ember';

export default Ember.Route.extend({
  actions: {
    out(){
      this.get('currentUser').invalidate();
    },

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
