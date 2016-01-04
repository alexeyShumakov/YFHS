import Ember from 'ember';

export default Ember.Route.extend({
  includeParams: 'user,player-class,deck-type,builder-cards,builder-cards.card',
  model(params){
    params['include'] = this.get('includeParams');
    let store = this.store;
    let deck = store.query('deck', params).then(
      function(decks){ return decks.get('firstObject') }
    );
    return Ember.RSVP.hash({
      deck: deck,
      deckTypes: store.findAll('deck_type')
    })
  },

  afterModel(model){
    model.deck.get('cards');
    if (!this.get('currentUser').canEdit(model.deck)){
      this.transitionTo('application');
    }
  }
});
