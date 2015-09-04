YFHS.CurrentUserService = Ember.Service.extend
  email: ''
  password: ''
  passwordConfirmation: ''
  rememberMe: true
  logInError: ''
  isLogInError: false
  isLogIn: false
  data: ''
  getUser: ()->
    _this = @
    $.getJSON('/users/get_current_user').then(
      (data)->
        _this.set 'isLogIn', true
        _this.set 'data', data
    )

  log: ()->
    console.log('test service')