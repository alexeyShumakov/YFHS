import Base from 'ember-simple-auth/authorizers/base';

export default Base.extend({

  authorize: function(data, block) {
    block('access-token', data['headers']['access-token']);
    block('token-type', data['headers']['token-type']);
    block('client', data['headers']['client']);
    block('expiry', data['headers']['expiry']);
    block('uid', data['headers']['uid']);
  }
});