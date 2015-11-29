import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('log-in', 'Integration | Component | log in', {
  integration: true
});

test('it invalid email format', function(assert) {

  this.render(hbs`{{log-in}}`);

  let emailInput = this.$('#email');
  emailInput.focus();
  emailInput.val('test@test');
  emailInput.blur();
  assert.equal(this.$('.help-block').text().trim(), 'This field must be a valid email address');
});

test('it empty email', function(assert) {

  this.render(hbs`{{log-in}}`);

  let emailInput = this.$('#email');
  emailInput.focus();
  emailInput.val('');
  emailInput.blur();
  assert.equal(this.$('.help-block').text().trim(), "This field can't be blank");
});

test('it valid email format', function(assert) {

  this.render(hbs`{{log-in}}`);

  let emailInput = this.$('#email');
  emailInput.focus();
  emailInput.val('test@test.com');
  emailInput.blur();
  assert.equal(this.$('.help-block').text(), '');
});

test('it short password', function(assert) {

  this.render(hbs`{{log-in}}`);

  let passwordInput = this.$('#password');
  passwordInput.focus();
  passwordInput.val('test');
  passwordInput.blur();
  assert.equal(this.$('.help-block').text().trim(), 'This field is too short (minimum is 8 characters)');
});

test('it empty password', function(assert) {

  this.render(hbs`{{log-in}}`);

  let passwordInput = this.$('#password');
  passwordInput.focus();
  passwordInput.val('');
  passwordInput.blur();
  assert.equal(this.$('.help-block').text().trim(), "This field can't be blank");
});

test('it enable button', function(assert) {

  this.render(hbs`{{log-in}}`);

  let passwordInput = this.$('#password');
  passwordInput.focus();
  passwordInput.val('password');
  passwordInput.blur();
  let emailInput = this.$('#email');
  emailInput.focus();
  emailInput.val('test@test.com');
  emailInput.blur();
  assert.equal(this.$('button').attr('disabled'), null);
});

test('it open password-new', function(assert) {

  this.set('openAction', (actual)=>{
    assert.equal(actual, 'password-new');
  });
  this.render(hbs`{{log-in open=(action openAction)}}`);
  this.$('.checkbox a').click();

});

test('it close and open sign-up', function(assert) {

  this.set('openAction', (actual)=>{
    assert.equal(actual, 'sign-up');
  });
  this.set('closeAction', ()=>{
    assert.ok('it Close');
  });
  this.render(hbs`{{log-in open=(action openAction) close=(action closeAction)}}`);
  this.$('.modal-footer a').click();

});

