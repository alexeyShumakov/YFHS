# for more details see: http://emberjs.com/guides/components/

YFHS.ModalDialogComponent = Ember.Component.extend({
  actions:
    close: ()->
      @.sendAction();

})

