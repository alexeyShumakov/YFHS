# for more details see: http://emberjs.com/guides/components/

YFHS.LogInComponent = Ember.Component.extend({
  currentUser: Ember.inject.service('current-user')
  actions:
    passwordNew: ()->
      @.sendAction 'open', 'password-new'

    logIn:()->
      _this = @
      $.ajax({
        url: '/users/sign_in'
        dataType: 'json'
        method: 'post'
        data:
          user:
            password: @.get 'currentUser.password'
            email: @.get 'currentUser.email'
            remember_me: @.get 'currentUser.rememberMe'
      }).then(
        ()->
          _this.set 'currentUser.isLogInError', false
          _this.get('currentUser').getUser()
          _this.sendAction('close')
        (data)->
          response = $.parseJSON data.responseText
          _this.set 'currentUser.logInError', response.error
          _this.set 'currentUser.isLogInError', true
      )
})

