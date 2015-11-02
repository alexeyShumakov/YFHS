# for more details see: http://emberjs.com/guides/components/

YFHS.UserPopupComponent = Ember.Component.extend({
  isShowPopup: false
  mouseEnter: ()->
    console.log 'enter'
    @set 'isShowPopup', true
  mouseLeave: ()->
    console.log 'leave'
    @set 'isShowPopup', false
})

