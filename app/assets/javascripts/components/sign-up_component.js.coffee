# for more details see: http://emberjs.com/guides/components/

YFHS.SignUpComponent = Ember.Component.extend
  currentUser: Ember.inject.service('current-user')
  actions:
    signUp:()->
      _this = @
      user = @.get 'user'
      user.set 'email', @.get 'currentUser.email'
      user.set 'password', @.get 'currentUser.password'
      user.set 'password_confirmation', @.get 'currentUser.passwordConfirmation'
      user.save().then(
        ()->
          _this.sendAction()
      )

