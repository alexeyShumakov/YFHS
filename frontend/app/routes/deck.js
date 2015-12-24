import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    params['include'] = 'user,player-class,deck-type,builder-cards,builder-cards.card';
    return this.store.queryRecord('deck', params).then(function(deck){
      return deck.get( 'firstObject' );
    });
  }
});
