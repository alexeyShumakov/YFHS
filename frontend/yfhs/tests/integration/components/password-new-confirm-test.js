import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('password-new-confirm', 'Integration | Component | password new confirm', {
  integration: true
});

test('it enable button', function(assert) {
  
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });" + EOL + EOL +

  this.render(hbs`{{password-new-confirm}}`);

  let passwordInput = this.$('#password');
  passwordInput.focus();
  passwordInput.val('password');
  passwordInput.blur();

  let passwordConfirmationInput = this.$('#confirm-password');
  passwordConfirmationInput.focus();
  passwordConfirmationInput.val('password');
  passwordConfirmationInput.blur();

  assert.equal(this.$('button').attr('disabled'), null);
});
