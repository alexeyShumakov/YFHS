import Ember from 'ember';

export default Ember.Component.extend({
  actions:{
    deleteNews(){
      this.get('news').destroyRecord();
    }
  }
});
