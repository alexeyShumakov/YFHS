import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('sign-up', 'Integration | Component | sign up', {
  integration: true
});

test('it renders', function(assert) {

  this.render(hbs`{{sign-up}}`);

  let nicknameInput = this.$('#nickname');
  nicknameInput.focus();
  nicknameInput.val('test_nickname');
  nicknameInput.blur();

  let emailInput = this.$('#email');
  emailInput.focus();
  emailInput.val('test@test.com');
  emailInput.blur();

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
