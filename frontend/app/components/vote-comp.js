import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['vote'],
  tagName: 'span',

  actions:{
    increaseVote(){
      this.get('model').increaseVote();
    },

    decreaseVote(){
      this.get('model').decreaseVote();
    }

  }
});
