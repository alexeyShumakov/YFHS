# for more details see: http://emberjs.com/guides/components/

YFHS.PasswordNewComponent = Ember.Component.extend({
  currentUser: Ember.inject.service('current-user')
  inNewPasswordError: false
  actions:
    createNewPassword: ()->
      _this = @
      $.ajax({
        url: '/users/password'
        dataType: 'json'
        method: 'post'
        data:
          user:
            email: @.get 'currentUser.email'
      }).then(
        ()->
          _this.sendAction 'close'
          _this.sendAction 'openHint', 'password-new-hint'
          _this.set 'isNewPasswordError', false
        (data)->
          response = $.parseJSON data.responseText
          _this.set 'newPasswordError', response.errors
          _this.set 'isNewPasswordError', true
      )
})

