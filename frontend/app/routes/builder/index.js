import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let store = this.store;
    return Ember.RSVP.hash({
      pClass: store.findAll('player_class'),
      topDecks: store.query('deck', {limit: 5}),
      topSynergies: store.query('synergy', {limit: 5}),
      topCards: store.query('card', {limit: 5}),
      streams: store.query('twitchStream', {})
    });

  }
});
