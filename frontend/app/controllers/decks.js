import Ember from 'ember';

export default Ember.Controller.extend({
  search(){
    var name = this.get('nameText');
    if (Ember.isEmpty(name)){ name = null }
    this.transitionToRoute('decks.search', {queryParams: {name: name}});
  },

  actions: {
    nameSearch(name){
      Ember.run.debounce(this, this.search, 300);
    }
  },
  clearProp(){
    this.setProperties({ nameText: null });
  }
});
