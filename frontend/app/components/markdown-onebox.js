import Ember from 'ember';

export default Ember.Component.extend({
  oneBox: Ember.inject.service(),
  didInsertElement(){
    if (!this.get('placeholder')){
      this.get('oneBox').preview(this.getId());
    }
  },

  getId(){
    return `#${this.get('elementId')}`;
  },

  obs: Ember.observer('text', function(){
    if (this.get('placeholder')){
      this.get('oneBox').placeholder(this.getId());
    }
  })
});
