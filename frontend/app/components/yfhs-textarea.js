import Ember from 'ember';

export default Ember.Component.extend({
  store: Ember.inject.service(),
  shadowTextarea(index){
    let ta  = this.$('textarea');
    let sta = this.$('.auto-comp__shadow-textarea');
    sta.width(ta.width());
    sta.height(ta.height());

    let text = ta[0].value;
    let preCaret = text.substring(0, index + 1);
    this.set('preCaret', preCaret);

    Ember.run.scheduleOnce('afterRender', this, function () {
      let pos = this.$('.caret').position();
      let cssPosition =  new Ember.Handlebars.SafeString(`top:${pos.top + 20}px; left:${pos.left}px`);
      this.set('position', cssPosition );
    });
  },
  keyUp(key){
    let _this = this;
    var input = this.$("textarea");
    var subString = input[0].value.substring(0, input[0].selectionStart);
    var mention = /(\s|^)@(\w+)$/;
    var user = mention.exec(subString);
    if (Ember.isPresent(user)) {
      this.shadowTextarea(user.index);
      this.get('store').query('user',{nickname: user[2].toLowerCase()}).then(
        function (users) {
          _this.set('users', users);
        }
      )
    } else {
      _this.set('users', null);
    }

    var cardReg = /%([a-zA-Zа-яА-Я\.\-_']{1,100})$/;
    var card  = cardReg.exec(subString);
    if (Ember.isPresent(card)){
      this.shadowTextarea(card.index);
      this.get('store').query('card', {name: card[1]}).then(
        function(cards){
          _this.set('cards', cards);
        }
      )
    } else {
      _this.set('cards', null);
    }
  },
  actions: {
    selectCard(name){
      name = name.replace(/ /g, '_');
      var input = this.$("textarea");
      var subString = this.get('text').substring(0, input[0].selectionStart);
      var afterCard = this.get('text').substring(input[0].selectionStart);
      var cardReg = /%([a-zA-Zа-яА-Я\.\-_']{1,100})$/;
      if (Ember.isPresent(afterCard)){
        subString = subString.replace(cardReg, `%${name}`);
      } else {
        subString = subString.replace(cardReg, `%${name} `);
      }
      this.set('cards', null);
      this.set('text', subString + afterCard);
      Ember.run.scheduleOnce('afterRender', this, function () {
        input.focus();
        input[0].selectionStart = subString.length;
        input[0].selectionEnd = subString.length;
      });

    },
    selectUser(name){
      var input = this.$("textarea");
      var subString = this.get('text').substring(0, input[0].selectionStart);
      var afterMention = this.get('text').substring(input[0].selectionStart);
      if (Ember.isPresent(afterMention)){
        subString = subString.replace(/(\s|^)@(\w+)$/, `$1@${name}`);
      } else {
        subString = subString.replace(/(\s|^)@(\w+)$/, `$1@${name} `);
      }
      this.set('users', null);
      this.set('text', subString + afterMention);
      Ember.run.scheduleOnce('afterRender', this, function () {
        input.focus();
        input[0].selectionStart = subString.length;
        input[0].selectionEnd = subString.length;
      });
    }
  }
});
