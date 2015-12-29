import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    let store = this.store;
    return Ember.RSVP.hash({
      news: store.findRecord('news', params['id']),
      topDecks: store.query('deck', {limit: 5}),
      topSynergies: store.query('synergy', {limit: 5}),
      topCards: store.query('card', {limit: 5}),
      streams: store.query('twitchStream', {})
    })
  },

  actions: {
    delete(){
      let _this = this;
      this.modelFor(this.routeName).destroyRecord().then(
        function () {
          _this.transitionTo('news');
        });
    }
  }
});
