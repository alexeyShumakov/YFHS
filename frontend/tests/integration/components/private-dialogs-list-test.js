import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('private-dialogs-list', 'Integration | Component | private dialogs list', {
  integration: true
});

test('it renders', function(assert) {
  
  // Set any properties with this.set('myProperty', 'value');
  // Handle any actions with this.on('myAction', function(val) { ... });" + EOL + EOL +

  this.render(hbs`{{private-dialogs-list}}`);

  assert.equal(this.$().text().trim(), '');

  // Template block usage:" + EOL +
  this.render(hbs`
    {{#private-dialogs-list}}
      template block text
    {{/private-dialogs-list}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});
