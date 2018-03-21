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
    tags: credentials.tags,
    basePrice: credentials.basePrice,
    stock: credentials.stock,
    attributes: credentials.attributes,
    devCred: credentials.devCred
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

module.exports = controller({
  index,
  show,
  create
}, { before: [
  { method: setModel(Item), only: ['show'] }
] })
