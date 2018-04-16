'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Charge = models.charge
const authenticate = require('./concerns/authenticate')
const stripe = require('stripe')('sk_test_q60nMuMw7awlmcjHAOQdTSu0')

const create = (req, res, next) => {
  const data = {
    email: req.body.charge.email,
    source: req.body.charge.stripeToken,
    description: req.body.charge.description,
    shipping: req.body.charge.shipping,
    amount: req.body.charge.amount,
    currency: req.body.charge.currency
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
      customer: customer.id
    })
  .then(charge => {
    res.send(charge)
    // more of the charge itself
    Charge.create({
      // the token id (the credit card)
      'stripeToken': charge.id,
      // amount is always in cents
      'amount': charge.amount,
      '_owner': req.user._id
    })
  })
    // error return
      .catch(error => console.log(error))
  })
}

module.exports = controller({
  create
}, { before: [
  { method: authenticate }
] })
