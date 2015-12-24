import Ember from 'ember';

export default Ember.Component.extend({
  tagName: 'tr',
  classNames: ['card-list__item'],
  imgVisability: false,

  mouseX: 0,
  mouseY: 0,

  imgPosition: Ember.computed('mouseX', function(){
    let position = `top:${this.get('mouseY') - 330}px; left:${this.get('mouseX') + 15}px;`;
    return Ember.String.htmlSafe(position);

  }),

  click(){
    this.sendAction('action', this.get('card'));

  },

  mouseMove(event){
    this.set('mouseX', event.clientX);
    this.set('mouseY', event.clientY);

  },

  mouseEnter(){
    this.set('imgVisability', true);
  },

  mouseLeave(){
    this.set('imgVisability', false);
  }
});
