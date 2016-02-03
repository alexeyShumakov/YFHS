import Ember from 'ember';

export default Ember.Controller.extend({
  reset(){
    this.set('name', null);
    this.set('body', null);
    this.set('selectedCategory', null);
  },
  actions: {
    setGC(category){
      this.set('selectedCategory', category);
    },
    create(){
      let _this = this;
      this.set('model.guide.name', this.get('name'));
      this.set('model.guide.body', this.get('body'));
      this.set('model.guide.guideCategory', this.get('selectedCategory'));

      this.get('model.guide').save().then(function(){
        _this.transitionToRoute('guides');
        _this.reset();
      });
    }
  }
});
