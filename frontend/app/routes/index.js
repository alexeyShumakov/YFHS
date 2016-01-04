import Ember from 'ember';

export default Ember.Route.extend({
  newsQueryParams: {include: 'user', sort:'-created_at'},
  model(){
    let store = this.store;
    return Ember.RSVP.hash({
      news: store.query('news', this.get('newsQueryParams')),
      newDecks: store.query('deck',
        {
          include: 'user,player-class,deck-type,builder-cards,builder-cards.card',
          sort:'-created_at',
          limit: 5,
          sort_rule: 'newest'
        }
      ),
      topDecks: store.query('deck', {limit: 5}),
      topSynergies: store.query('synergy', {limit: 5}),
      topCards: store.query('card', {limit: 5}),
      streams: store.query('twitchStream', {})
    })
  },
  setupController(controller, model){
    this._super(controller, model);
    controller.set('params', this.get('newsQueryParams'));
  }
});
