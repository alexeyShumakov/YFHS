import Ember from 'ember';

export default Ember.Route.extend({
  queryParams: {
    player_class:{ refreshModel: true },
    deck_type: { refreshModel: true },
    name: { refreshModel: true }

  },
  includeParams: 'user,player-class,deck-type',

  model(params){
    params['include'] = this.get('includeParams');
    return this.store.query('deck', params);
  },

  setupController(controller, model, params){
    this._super(controller, model);
    params.queryParams['include'] = this.get('includeParams');
    controller.set('params', params.queryParams);
    this.controllerFor( 'decks').set('nameText', params.queryParams.name);
  },

  deactivate(){
    this.controller.clearProp();
  }
});
