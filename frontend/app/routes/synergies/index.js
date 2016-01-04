import Ember from 'ember';

export default Ember.Route.extend({
  includeParams: 'player-class,user,synergy-cards,synergy-cards.card',
  model(params){
    params.include = this.get('includeParams');
    return this.store.query('synergy', params);
  },
  setupController(controller, model, params){
    this._super(controller, model);
    params.queryParams['include'] = this.get('includeParams');
    controller.set('params', params.queryParams);
  }
});
