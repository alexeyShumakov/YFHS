import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('yfhs-textarea', 'Integration | Component | yfhs textarea', {
  integration: true
});

test('it renders', function(assert) {
  
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });" + EOL + EOL +

  this.render(hbs`{{yfhs-textarea}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:" + EOL +
  this.render(hbs`
    {{#yfhs-textarea}}
      template block text
    {{/yfhs-textarea}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
