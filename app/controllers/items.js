'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Item = models.item

const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Item.find()
    .then(items => res.json({
      items: items.map((e) =>
        e.toJSON({ virtuals: true }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    item: req.item.toJSON({ virtuals: true })
  })
}

const create = (req, res, next) => {
  const item = Object.assign(req.body.item)
  Item.create(item)
    .then(item =>
      res.status(201)
        .json({
          item: item.toJSON()
        }))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create
}, { before: [
  { method: setModel(Item), only: ['show'] }
] })
