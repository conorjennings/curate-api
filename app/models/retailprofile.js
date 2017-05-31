'use strict';

// Used examples.js as a template and edited to reflect needs of retailprofile
const mongoose = require('mongoose');

const retailprofileSchema = new mongoose.Schema({
  name: {
    type: String,
    required: true,
  },
  siteUrl: {
    type: String,
    required: true
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true,
  },
  vegan: {
    type: Boolean,
    required: false,
  },
  sustainable: {
    type: Boolean,
    required: false,
  },
  slow: {
    type: Boolean,
    required: false,
  },
  independent: {
    type: Boolean,
    required: false,
  },
  notes: {
    type: String,
    required: false,
  }
  // Placeholder for Amazon S3 link to image
  // imageUrl: {
  //   type: String,
  //   required: true,
  // }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      let userId = (options.user && options.user._id) || false;
      ret.editable = userId && userId.equals(doc._owner);
      return ret;
    },
  },
});

retailprofileSchema.virtual('length').get(function length() {
  return this.text.length;
});

const Retailprofile = mongoose.model('Retailprofile', retailprofileSchema);

module.exports = Retailprofile;
