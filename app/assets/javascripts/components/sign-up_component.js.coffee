# for more details see: http://emberjs.com/guides/components/

YFHS.SignUpComponent = Ember.Component.extend
  actions:
    signUp:()->
      _this = @
      user = @.get 'user'
      user.set 'email', @.get 'currentUser.email'
      user.set 'nickname', @get 'currentUser.nickname'
      user.set 'password', @.get 'currentUser.password'
      user.set 'password_confirmation', @.get 'currentUser.passwordConfirmation'
      user.save().then(
        ()->
          _this.sendAction 'close'
          _this.sendAction 'open', 'signuphint'
      )

