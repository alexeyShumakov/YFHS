import Ember from 'ember';
import config from './config/environment';

const Router = Ember.Router.extend({
  location: config.locationType
});

Router.map(function() {
  this.route('login');
  this.route('forbidden');

  this.route('guides');
  this.route('guide', {path: '/guides/:id'});
  this.route('new_guide', {path: '/guides/new'});
  this.route('edit_guide', {path: '/guides/:id/edit'});

  this.route('guide_categories');
});

export default Router;
