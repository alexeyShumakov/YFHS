import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    return Ember.RSVP.hash({
      guide: this.store.createRecord('guide'),
      guideCategories: this.store.findAll('guide-category')
    })
  }
});

