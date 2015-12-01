import { moduleFor, test } from 'ember-qunit';

moduleFor('validator:unique-nickname', 'Unit | Validator | unique-nickname', {
  needs: ['validator:messages']
});

test('it works', function(assert) {
  var validator = this.subject();
  assert.ok(validator);
});
