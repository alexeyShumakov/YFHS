import Ember from 'ember';
import BaseAuthenticator from 'ember-simple-auth/authenticators/base';
const { RSVP, isEmpty, run, get } = Ember;

export default BaseAuthenticator.extend({

  serverTokenEndpoint: '/users/sign_in',

  resourceName: 'user',

  tokenAttributeName: 'authentication_token',

  identificationAttributeName: 'email',

    restore(data) {
    const { tokenAttributeName, identificationAttributeName } = this.getProperties('tokenAttributeName', 'identificationAttributeName');
    const tokenAttribute = get(data, tokenAttributeName);
    const identificationAttribute = get(data, identificationAttributeName);
    return new RSVP.Promise((resolve, reject) => {
      if (!isEmpty(tokenAttribute) && !isEmpty(identificationAttribute)) {
        resolve(data);
      } else {
        reject();
      }
    });
  },

    authenticate(identification, password) {
    return new RSVP.Promise((resolve, reject) => {
      const { resourceName, identificationAttributeName } = this.getProperties('resourceName', 'identificationAttributeName');
      const data         = {};
      data[resourceName] = { password };
      data[resourceName][identificationAttributeName] = identification;

      this.makeRequest(data).then(function(response) {
        run(null, resolve, response);
      }, function(xhr) {
        run(null, reject, xhr.responseJSON || xhr.responseText);
      });
    });
  },

    invalidate() {
      return Ember.$.ajax({
        url: 'users/sign_out',
        type: 'delete'
      })
  },

    makeRequest(data) {
    const serverTokenEndpoint = this.get('serverTokenEndpoint');
    return Ember.$.ajax({
      url:      serverTokenEndpoint,
      type:     'POST',
      dataType: 'json',
      data,
      beforeSend(xhr, settings) {
        xhr.setRequestHeader('Accept', settings.accepts.json);
      }
    });
  }
});
