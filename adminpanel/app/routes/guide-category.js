import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.query('guide-category', {include: 'guides', filter:{id: params.id}}).then(
      function(guides){
        return guides.get('firstObject');
      }
    );
  }
});
