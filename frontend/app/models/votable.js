import DS from 'ember-data';
import Ember from 'ember';

export default DS.Model.extend({
  currentUser: Ember.inject.service(),
  votes: DS.attr('number'),
  evaluationValue: DS.attr('number'),

  userIncreaseVote: Ember.computed('evaluationValue', function(){
    return this.get('evaluationValue') > 0;

  }),

  userDecreaseVote: Ember.computed('evaluationValue', function(){
    return this.get('evaluationValue') < 0;
  }),

  ajaxRequest(param){
    var _this = this;
    $.ajax({
      url: `/votes/${param}`,
      type: 'post',
      headers: this.get('currentUser.headers'),
      data:{
        id:     this.get('id'),
        object: this.get('constructor.modelName')
      }
    }).then(function(){
      _this.reload();
    });

  },

  increaseVote(){
    if (this.get('currentUser.isLogIn')){
      this.ajaxRequest('increase');
    }
  },

  decreaseVote(){
    if (this.get('currentUser.isLogIn')){
      this.ajaxRequest('decrease');
    }
  }
});
