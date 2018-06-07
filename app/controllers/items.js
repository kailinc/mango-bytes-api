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
  // req.body.cart.nested.stuff = 'ok'
  const credentials = req.body.credentials
  const item = {
    name: credentials.name,
    des: credentials.des,
    img: credentials.img,
    basePrice: credentials.basePrice,
    attributes: credentials.attributes,
    devCred: credentials.devCred,
    category: credentials.category
  }
  Item.create(item)
    .then(item => {
      res.status(201)
        .json({
          item: item.toJSON()
        })
    })
    .catch(next)
}

const destroy = (req, res, next) => {
  req.cart.remove()
    .then(() => res.sendStatus(204))
    .catch(next)
}

module.exports = controller({
  index,
  show,
  create,
  destroy
}, { before: [
  { method: setModel(Item), only: ['show'] }
] })
