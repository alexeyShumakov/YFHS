# for more details see: http://emberjs.com/guides/controllers/

YFHS.ApplicationController = Ember.Controller.extend
  actions:
    out:()->
      _this = @
      $.ajax({
        url: '/users/sign_out'
        method: 'delete'
        dataType: 'json'
      }).then(
        ()->
          _this.get('currentUser').set 'isLogIn', false
      )
