import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('password-new', 'Integration | Component | password new', {
  integration: true
});

test('it enable button', function(assert) {
  
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });" + EOL + EOL +

  this.render(hbs`{{password-new}}`);
  let emailInput = this.$('#email');
  emailInput.focus();
  emailInput.val('test@test.com');
  emailInput.blur();

  assert.equal(this.$('button').attr('disabled'), null);

});
