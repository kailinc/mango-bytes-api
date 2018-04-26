'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Charge = models.charge

const setUser = require('./concerns/set-current-user')
const authenticate = require('./concerns/authenticate')
const stripe = require('stripe')('sk_test_q60nMuMw7awlmcjHAOQdTSu0')

const index = (req, res, next) => {
  Charge.find()
    .then(charges => res.json({
      charges: charges.map((e) =>
        e.toJSON({ virtuals: true, user: req.user }))
    }))
    .catch(next)
}

const create = (req, res, next) => {
  const data = {
    email: "kailin@gmail.com",
    // email: req.body.charge.email,
    source: req.body.charge.stripeToken,
    description: req.body.charge.description,
    shipping: req.body.charge.shipping,
    amount: req.body.charge.amount,
    currency: req.body.charge.currency,
    userId: req.body.charge.userId,
    cartId: req.body.charge.cartId
  }
  // this data is given to us from the token from stripe
  stripe.customers.create({
    // in your stripe dashboard, this is the displayed email as customer
    email: data.email,
    // their card (it is hashed)
    source: data.source,
    description: data.description,
    shipping: data.shipping
  })
  .then(customer => {
    // the charge itself
    stripe.charges.create({
      // the amount
      amount: data.amount,
      // the description isn't nescesary but great for us to see later on
      description: data.description,
      currency: data.currency,
      // hashed by stripe and placed in the token for us
      customer: customer.id,
      receipt_email: data.email,
      shipping: data.shipping
    })
  })
  .then((charge) => {
    res.send(charge)
    Charge.create({
      'stripeToken': data.source,
      'amount': data.amount,
      'currency': data.currency,
      'cartId': data.cartId,
      '_owner': data.userId
    })
  })
  // .then(charge => {
  //   res.status(201)
  //     .json({
  //       charge: charge.toJSON()
  //     })
  // })
  .catch((err) => console.log(err))
}

module.exports = controller({
  index,
  create
}, { before: [
  { method: setUser, only: ['index'] },
  { method: authenticate, except: ['index'] }
] })
