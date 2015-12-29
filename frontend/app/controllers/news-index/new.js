import Ember from 'ember';

export default Ember.Controller.extend({
  actions:{
    save(){
      let _this = this;
      this.set('model.user', this.get('currentUser.user'));
      this.get('model').save().then(
          function(){
            _this.send('newModel');
          });
    }
  }
});
