'use strict'

const mongoose = require('mongoose')

// declaration of schema
const chargeSchema = new mongoose.Schema({
  stripeToken: {
    type: String,
    required: false
  },
  amount: {
    type: Number,
    required: false
  },
  currency: {
    type: String,
    required: false
  },
  cartId: {
    type: String,
    required: true
  },
  _owner: {
    type: mongoose.Schema.Types.ObjectId,
    ref: 'User',
    required: true
  }
}, {
  timestamps: true,
  toJSON: {
    virtuals: true,
    transform: function (doc, ret, options) {
      const userId = (options.user && options.user._id) || false
      ret.editable = userId && userId.equals(doc._owner)
      return ret
    }
  }
})

const Charge = mongoose.model('Charge', chargeSchema)

module.exports = Charge
