import Ember from 'ember';

export default Ember.Controller.extend({
  reset(){
    this.set('name', null);
  },
  actions: {
    create(){
      let _this = this;
      this.set('model.name', this.get('name'));

      this.get('model').save().then(function(){
        _this.transitionToRoute('guide_categories');
        _this.reset();
      });
    }
  }
});

