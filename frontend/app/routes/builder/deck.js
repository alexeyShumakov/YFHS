import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return Ember.RSVP.hash({
      playerClass: this.store.findRecord('player_class', params['id']),
      deck: this.store.createRecord('deck'),
      deckTypes: this.store.findAll('deck_type')
    });
  },

  afterModel(model){
    model.deck.set('playerClass', model.playerClass);
    model.deck.set('description', '');
    model.deck.set('name', model.playerClass.get('name'));
    model.deck.set('deckType', model.deckTypes.get('firstObject'));
    if (this.get('currentUser.isLogIn')){
      model.deck.set('user', this.get('currentUser.user'));
      model.deck.save()
    }
  },

  setupController(controller, model){
    this._super(controller, model);
    controller.set('currentPlayerClass', model.playerClass.get('en_name'));

  }
});
