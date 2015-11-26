import Ember from 'ember';
import { validator, buildValidations } from 'ember-cp-validations';

var Validations = buildValidations({
  nickname: [
    validator('presence', true),
    validator('length', {
      min: 4,
      max: 64
    }),
    validator('format', {
      regex: /^\w+$/
    })
  ],
  email: [
    validator('presence', true),
    validator('format', {
      type: 'email',
      regex:  /^([\w-]+(?:\.[\w-]+)*)@((?:[\w-]+\.)*\w[\w-]{0,66})\.([a-z]{2,6}(?:\.[a-z]{2})?)$/i
    })
  ],
  password: [
    validator('presence', true),
    validator('length', {
      min: 8,
      max: 32
    })
  ],
  verifiedPassword:validator('confirmation', {
    on: 'password',
    message: 'do not match'
  })
});

export default Ember.Component.extend(Validations, {

  actions:{
    signUp(){
    }
  }
});
