import Ember from 'ember';

export default Ember.Component.extend({
  classNames: ['class-list', 'nav', 'nav-pills', 'nav-justified'],
  tagName: 'ul',

  playerClasses: Ember.computed('tempPlayerClasses', function() {
    let classes = this.get('tempPlayerClasses');
    let currentPC = this.get('currentPlayerClass');

    if (Ember.isBlank(currentPC)){
      return classes;
    } else {
      classes.filter((item)=>{
        return (item.get('name') == currentPC) || (item.get('name') == 'Neutral');
      });
    }
  }),

  tempPlayerClasses: Ember.A([
    Ember.Object.create({title: 'Нейтральные', name: 'Neutral', isActive: false}),
    Ember.Object.create({title: 'Друид', name: 'Druid', isActive: false}),
    Ember.Object.create({title: 'Жрец', name: 'Priest', isActive: false}),
    Ember.Object.create({title: 'Охотник', name: 'Hunter', isActive: false}),
    Ember.Object.create({title: 'Разбойница', name: 'Rogue', isActive: false}),
    Ember.Object.create({title: 'Воин', name: 'Warrior', isActive: false}),
    Ember.Object.create({title: 'Чернокнижник', name: 'Warlock', isActive: false}),
    Ember.Object.create({title: 'Маг', name: 'Mage', isActive: false}),
    Ember.Object.create({title: 'Шаман', name: 'Shaman', isActive: false}),
    Ember.Object.create({title: 'Паладин', name: 'Paladin', isActive: false})
  ]),

  willDestroyElement(){
    this.get('tempPlayerClasses').forEach((item)=>{
      item.set('isActive', false);
    });
  },

  actions:{
    classToggle(pClass, playerClasses){
      if(pClass.get('isActive')){
        pClass.set('isActive', false);
        this.sendAction('action', null);
      } else {
        playerClasses.forEach((pClass)=>{
          pClass.set('isActive', false);
        });
        pClass.set('isActive', true);
        this.sendAction('action', pClass.get('name'));
      }
    }
  }
});
