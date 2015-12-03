import DS from 'ember-data';

export default DS.JSONAPISerializer.extend({
  attrs: {
    votes: { serialize: false },
    evaluationValue:{ serialize: false },
    createdAt: {serialize: false},
    targetName: {serialize: false}
  }
});
