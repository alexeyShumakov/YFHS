import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['custom-alert', 'alert', 'alert-success'],
  actions: {
    transition(routeName, id){
      this.sendAction('close');
      this.sendAction('transition', routeName, id);
    }
  }
});
