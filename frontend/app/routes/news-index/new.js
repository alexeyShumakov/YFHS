import Ember from 'ember';

export default Ember.Route.extend({
  model(){
    let news = this.store.createRecord('news');
    news.set('body', '');
    return news;
  },

  deactivate(){
    this.modelFor(this.routeName).unloadRecord();
  },

  actions:{
    newModel(){
      this.refresh();
    }
}
});
