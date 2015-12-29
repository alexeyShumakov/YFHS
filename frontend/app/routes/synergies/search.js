import Ember from 'ember';

export default Ember.Route.extend({
  queryParams:{
    player_class:{ refreshModel: true },
    name: {refreshModel: true }
  },

  model(params){
    params.include = 'player-class,user,synergy-cards,synergy-cards.card';
    return this.store.query('synergy', params);
  },

  setupController(controller, model, params){
    this._super(controller, model);
    controller.set('params', params.queryParams);
    this.controllerFor( 'synergies').set('nameText', params.queryParams.name);
  },

  deactivate(){
    this.controller.clearProp();
  }
});
