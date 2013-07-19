// Generated by CoffeeScript 1.6.1
(function() {
  var NodeValidator, Resource, ResourceValidator,
    __hasProp = {}.hasOwnProperty,
    __extends = function(child, parent) { for (var key in parent) { if (__hasProp.call(parent, key)) child[key] = parent[key]; } function ctor() { this.constructor = child; } ctor.prototype = parent.prototype; child.prototype = new ctor(); child.__super__ = parent.prototype; return child; };

  NodeValidator = require('./nodeValidator');

  Resource = require('../Resource');

  module.exports = ResourceValidator = (function(_super) {

    __extends(ResourceValidator, _super);

    function ResourceValidator() {
      ResourceValidator.__super__.constructor.call(this, 'kn_Post');
    }

    ResourceValidator.prototype.validate = function(data, _) {
      ResourceValidator.__super__.validate.call(this, data);
      this.check(data.__CreatedOn__).notNull().isInt();
      this.check(data.title).notEmpty();
      data.active = this.sanitize(data.active).toBoolean();
      if ((data.url != null) || data.resourceType === Resource.Type.WIKIPEDIA_ARTICLE) {
        return this.check(data.url).isUrl();
      }
    };

    return ResourceValidator;

  })(NodeValidator);

}).call(this);
