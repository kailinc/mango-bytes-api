'use strict'

const controller = require('lib/wiring/controller')
const models = require('app/models')
const Charge = models.charge
const authenticate = require('./concerns/authenticate')
const stripe = require('stripe')('sk_test_q60nMuMw7awlmcjHAOQdTSu0')

const create = (req, res, next) => {
  console.log('create', req)
  // this data is given to us from the token from stripe
  stripe.customers.create({
    // in your stripe dashboard, this is the displayed email as customer
    email: req.body.charge.email,
    // their card (it is hashed)
    source: req.body.charge.id
  })
  .then(customer => {
    // the charge itself
    stripe.charges.create({
      // the amount
      amount: '999',
      // the description isn't nescesary but great for us to see later on
      description: 'Sample Charge',
      currency: 'usd',
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
