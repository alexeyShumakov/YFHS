import Ember from 'ember';

export default Ember.Route.extend({
  notifications: Ember.inject.service(),
  beforeModel(transition){
    this.get('notifications').subscribe();
    this.set('currentUser.qParams', transition.queryParams);
    if( transition.queryParams['account_confirmation_success'] === 'true' ) {
      this.set('modal', 'hint-confirm');
    } else if (Ember.isPresent(transition.queryParams['reset_password_token'])) {
      this.set('token', transition.queryParams['reset_password_token']);
      this.set('modal', 'password-new-confirm');
    }
    return this.get('currentUser').setCurrentUser();
  },
  afterModel(){
    if (this.get('currentUser.isLogIn')) {
      let _this = this;
      let userId = this.get('currentUser.session.session.content.authenticated.id');
      MessageBus.subscribe(`/users/${userId}/event`, function (data) {
        let model = JSON.parse(data);

        if (Ember.isPresent(model.totalUnreadMessages)){
          _this.set('currentUser.user.totalUnreadMessages', model.totalUnreadMessages);
        }

        if (Ember.isPresent(model.publicNickname)) {
          if(!Ember.isEqual(_this.get('notifications.companyPublicNickname'), model.publicNickname)){
            _this.render( 'notifi',{
              into: 'application',
              outlet: 'modal',
              model: model
            });
          }
        }
      });
    }
  },
  renderTemplate(controller, model){
    this._super(controller, model);
    let modal = this.get('modal');
    if (Ember.isPresent(modal)){
      this.render(modal, {
        into: 'application',
        outlet: 'modal',
        model: this.get('token')
      });
    }

  },
  actions: {
    transition(routeName, id){
      this.transitionTo(routeName, id);
    },
    out(){
      this.get('currentUser').invalidate().then(
        function(){
          window.location.replace('/');
        });

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
