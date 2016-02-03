import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.query('guide', {include: 'guide-category', filter:{id: params.id}}).then(
      function(guides){
        return guides.get('firstObject');
      }
    );
  }
});
