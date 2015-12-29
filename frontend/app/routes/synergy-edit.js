import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    let include = 'player-class,synergy-cards,synergy-cards.card,user';
    return this.store.query('synergy', { id: params.id, include:include }).then(
      function(synergies){
        return synergies.get('firstObject');
      })
  },

  afterModel(model){
    console.log(model);
    if (this.get('currentUser.isLogIn')){
      if (!(this.get('currentUser.user.isAdmin') || this.get('currentUser.user').isAuthor(model))){
        this.transitionTo('application');
      }
    } else {
      this.transitionTo('application');
    }
  }
});
