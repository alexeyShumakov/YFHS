import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let store = this.store;
    return Ember.RSVP.hash({
      deckTypes:      store.findAll('deck_type'),
      playerClasses:  store.findAll('player_class')
    });
  },
  deactivate(){
    this.controller.clearProp();
  }
});
