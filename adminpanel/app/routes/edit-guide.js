import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    let guide = this.store.query('guide', {filter: { id: params.id}, include:'guide-category'}).then(function(guide){
        return guide.get('firstObject');
      });
    return Ember.RSVP.hash({
      guide: guide,
      guideCategories: this.store.findAll('guide-category')
    });
  },
  setupController(controller, model){
    this._super(controller, model);
    controller.set('name', model.guide.get('name'));
    controller.set('body', model.guide.get('body'));
    controller.set('selectedCategory', model.guide.get('guideCategory'));
  }
});
