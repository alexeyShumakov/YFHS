import Ember from 'ember';
import Base from 'ember-simple-auth/authenticators/base';

const { RSVP, run, } = Ember;

export default Base.extend({

  data: {},

  serverTokenEndpoint: '/auth/sign_in',

  resourceName: 'user',

  tokenAttributeName: 'token',

  identificationAttributeName: 'email',

  restore(data) {
    var propertiesObject = Ember.Object.create(data);

    return new Ember.RSVP.Promise(function(resolve, reject) {
      if (!Ember.isEmpty(propertiesObject)) {
        resolve(data);
      } else {
        reject();
      }
    });
  },

  authenticate(identification, password) {
    return new RSVP.Promise((resolve, reject) => {
      const { resourceName, identificationAttributeName } = this.getProperties('resourceName', 'identificationAttributeName');
      let data = this.get('data');
      data[resourceName] = { password };
      data[resourceName][identificationAttributeName] = identification;

      this.makeRequest(data).then(function(response) {
        run(null, resolve, response);
      }, function(xhr) {
        run(null, reject, xhr.responseJSON || xhr.responseText);
      });
    });
  },

  invalidate(data) {
    return new RSVP.Promise((resolve, reject) => {
      Ember.$.ajax({
        url:      'auth/sign_out',
        type:     'DELETE',
        dataType: 'json',
        beforeSend(xhr) {
          xhr.setRequestHeader('access-token', data['headers']['access-token']);
          xhr.setRequestHeader('token-type', data['headers']['token-type']);
          xhr.setRequestHeader('client', data['headers']['client']);
          xhr.setRequestHeader('expiry', data['headers']['expiry']);
          xhr.setRequestHeader('uid', data['headers']['uid']);
        }
      }).then(
        function(){
          resolve();
        }, function(){
          reject();
        }
      );
    });
  },

  makeRequest(data) {
    const serverTokenEndpoint = this.get('serverTokenEndpoint');
    return Ember.$.ajax({
      url:      serverTokenEndpoint,
      type:     'POST',
      dataType: 'json',
      data:     data.user,
      success: function(data, textStatus, request){
        data['headers'] = {};
        data['headers']['access-token'] = request.getResponseHeader('access-token');
        data['headers']['token-type'] = request.getResponseHeader('token-type');
        data['headers']['client'] = request.getResponseHeader('client');
        data['headers']['expiry'] = request.getResponseHeader('expiry');
        data['headers']['uid'] = request.getResponseHeader('uid');
      },
      beforeSend(xhr, settings) {
        xhr.setRequestHeader('Accept', settings.accepts.json);
      }
    });
  }
});
