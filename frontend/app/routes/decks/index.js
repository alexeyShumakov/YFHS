import Ember from 'ember';

export default Ember.Route.extend({
  includeParams: 'user,player-class,deck-type',
  model(params){
    params['include'] = this.get('includeParams');
    let store = this.store;
    return store.query('deck', params);
  },
  setupController(controller, model, params){
    this._super(controller, model);
    params.queryParams['include'] = this.get('includeParams');
    controller.set('params', params.queryParams);
  }
});
