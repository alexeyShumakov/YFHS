import { moduleForComponent, test } from 'ember-qunit';
import hbs from 'htmlbars-inline-precompile';

moduleForComponent('modal-dialog', 'Integration | Component | modal dialog', {
  integration: true
});

test('it renders', function(assert) {
  
  this.render(hbs`
    {{#modal-dialog}}
      template block text
    {{/modal-dialog}}
  `);

  assert.equal(this.$().text().trim(), 'template block text');
});

test('it close', function(assert) {

  this.set('closeAction', ()=> {
    assert.ok('close Action triggered');
  });
  this.render(hbs`{{modal-dialog action=(action closeAction)}}`);

  this.$('.overlay').click();
});
