'use strict';

const controller = require('lib/wiring/controller');
const models = require('app/models');
const RetailProfile = models.retailprofile;

const authenticate = require('./concerns/authenticate');
const setUser = require('./concerns/set-current-user');
const setModel = require('./concerns/set-mongoose-model');

const index = (req, res, next) => {
  // Modified params on .find() to limit records to those owned by current user.
  RetailProfile.find({owner: req.user.id})
    .then(retailprofiles => res.json({
      retailprofiles: retailprofiles.map((e) =>
        e.toJSON({ virtuals: true, user: req.user })),
    }))
    .catch(next);
};

const show = (req, res) => {
  res.json({
    retailprofile: req.retailprofile.toJSON({ virtuals: true, user: req.user }),
  });
};

const create = (req, res, next) => {
  let retailprofile = Object.assign(req.body.retailprofile, {
    _owner: req.user._id,
  });
  Retailprofile.create(retailprofile)
    .then(retailprofile =>
      res.status(201)
        .json({
          retailprofile: retailprofile.toJSON({ virtuals: true, user: req.user }),
        }))
    .catch(next);
};

const update = (req, res, next) => {
  delete req.body._owner;  // disallow owner reassignment.
  req.retailprofile.update(req.body.retailprofile)
    .then(() => res.sendStatus(204))
    .catch(next);
};

const destroy = (req, res, next) => {
  req.retailprofile.remove()
    .then(() => res.sendStatus(204))
    .catch(next);
};

module.exports = controller({
  index,
  show,
  create,
  update,
  destroy,
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Retailprofile), only: ['show'] },
  { method: setModel(Retailprofile, { forUser: true }), only: ['update', 'destroy'] },
], });
