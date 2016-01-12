import Ember from 'ember';

export default Ember.Route.extend({
  model(params){
    return this.store.query('user', {filter: {nickname: params.nickname.toLowerCase()}}).then(
      function(users){
        return users.get('firstObject');
      }
    );
  },
  actions: {
    showSendMessage(user){
      let controller = this.controllerFor('send-message');
      controller.set('model', user);
      this.render('sendMessage', {
        outlet: 'modal',
        controller: controller
      });
    }
  }
});
