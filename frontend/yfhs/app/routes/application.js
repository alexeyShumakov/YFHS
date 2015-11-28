import Ember from 'ember';

export default Ember.Route.extend({
  beforeModel(transition){
    this.set('currentUser.qParams', transition.queryParams);
    if( transition.queryParams['account_confirmation_success'] === 'true' ) {
      this.set('modal', 'hint-confirm');
    } else if (transition.queryParams['reset_password'] === 'true') {
        this.set('modal', 'password-new-confirm');
    }
  },
  model() {
    return this.store.findAll('user');
  },
  renderTemplate(controller, model){
    this._super(controller, model);
    let modal = this.get('modal');
    if (Ember.isPresent(modal)){
      this.render(modal, {
        into: 'application',
        outlet: 'modal'
      });
    }

  },
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
