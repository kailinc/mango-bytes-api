'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Cart = models.cart

const authenticate = require('./concerns/authenticate')
const setUser = require('./concerns/set-current-user')
const setModel = require('./concerns/set-mongoose-model')

const index = (req, res, next) => {
  Cart.find()
    .then(carts => res.json({
      carts: carts.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const show = (req, res) => {
  res.json({
    cart: req.cart.toJSON({ virtuals: true, user: req.user })
  })
}

const indexOwnCart = (req, res, next) => {
  Cart.find({ _owner: req.params.id })
    .then(carts => res.json({
      carts: carts.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const create = (req, res, next) => {
  // req.body.cart.nested.stuff = 'ok'
  const cart = Object.assign(req.body.cart, {
    _owner: req.user._id
  })
  Cart.create(cart)
    .then(cart => {
      res.status(201)
        .json({
          cart: cart.toJSON({ virtuals: true, user: req.user })
        })
    })
    .catch(next)
}

// post.save(function(error) {
//     if (!error) {
//         Post.find({})
//             .populate('postedBy')
//             .populate('comments.postedBy')
//             .exec(function(error, posts) {
//                 console.log(JSON.stringify(posts, null, "\t"))
//             })
//     }
// });

const update = (req, res, next) => {
  console.log('cart is', req.cart)
  // const itemId = req.body.cart.products[0].item
  // Item.findById(itemId)
  //   .then((item) => function () {
  //     req.cart.products.push(item)
  //   })
  for (let i = 0; i < req.body.cart.products.length; i++) {
    for (let key in req.body.cart.products[i]) {
      if (key === '_id') {
        delete req.body.cart.products[i]['_id']
      }
    }
  }

  delete req.body._owner  // disallow owner reassignment.
  req.cart.update(req.body.cart)
    .then(() => res.sendStatus(204))
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
  indexOwnCart,
  create,
  update,
  destroy
}, { before: [
  { method: setUser, only: ['index', 'show'] },
  { method: authenticate, except: ['index', 'show'] },
  { method: setModel(Cart), only: ['show'] },
  { method: setModel(Cart, { forUser: true }), only: ['update', 'destroy'] }
] })
