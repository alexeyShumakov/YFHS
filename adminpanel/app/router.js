import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('forbidden');
  this.route('guides', function(){
    this.route('new');
  });
  this.route('new_guide', {path: '/guides/new'});
  this.route('guide_categories');
});

export default Router;
