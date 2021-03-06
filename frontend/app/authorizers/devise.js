import Ember from 'ember';
import Base from 'ember-simple-auth/authorizers/base';

const { isEmpty } = Ember;

export default Base.extend({

  tokenAttributeName: 'authentication_token',

  identificationAttributeName: 'email',

    authorize(data, block) {
    const { tokenAttributeName, identificationAttributeName } = this.getProperties('tokenAttributeName', 'identificationAttributeName');
    const userToken          = data[tokenAttributeName];
    const userIdentification = data[identificationAttributeName];
    if (!isEmpty(userToken) && !isEmpty(userIdentification)) {
      block('X-User-Email', `${userIdentification }`);
      block('X-User-Token', `${userToken}`);
    }
  }
});