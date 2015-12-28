import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    let store = this.store;
    return Ember.RSVP.hash({
      playerClass: store.findRecord('player_class', params['id']),
      synergy: store.createRecord('synergy'),
      deckTypes: store.findAll('deck_type')
    });
  },
  afterModel(model){
    model.synergy.set('name', `${model.playerClass.get('name')}-синергия`);
    model.synergy.set('playerClass', model.playerClass);
    model.synergy.set('description', '');
    if (this.get('currentUser.isLogIn')) {
      model.synergy.set('user', this.get('currentUser.user'));
      model.synergy.save()
    }
  },
  setupController(controller, model){
    this._super(controller, model);
    controller.set('currentPlayerClass', model.playerClass.get('en_name'));
  }
});
