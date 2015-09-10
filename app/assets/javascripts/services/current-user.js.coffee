YFHS.CurrentUserService = Ember.Service.extend
  store: Ember.inject.service()
  email: ''
  password: ''
  passwordConfirmation: ''
  rememberMe: true
  logInError: ''
  isLogInError: false
  isLogIn: false
  user: ''
  getUser: ()->
    _this = @
    $.getJSON('/users/get_current_user').then(
      (data)->
        _this.get('store').findRecord('user', data.user.id).then(
          (user)->
            _this.set 'isLogIn', true
            _this.set 'user', user
        )
    )
